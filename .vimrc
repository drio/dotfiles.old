" vim :set foldmethod=manual:
set nocompatible
filetype off                   


set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-dispatch'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-eunuch'
Bundle 'yegappan/mru.git'
Bundle 'nicholaides/words-to-avoid.vim'
Bundle 'pbrisbin/vim-mkdir.git'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'

" These two go together
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim.git'

Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown.git'

Bundle 'file:///Users/drio/dev/vim-qmdown'

Bundle 'nvie/vim-flake8.git'
" Bundle 'bling/vim-airline'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'tomtom/tlib_vim'
" Bundle 'tomtom/viki_vim'
" Bundle 'sjl/gundo.vim'
" Bundle 'jelera/vim-javascript-syntax'
" Run :BundleInstall to install
call vundle#end()
filetype plugin indent on       " load file type plugins + indentation


set nu
set encoding=utf-8
set showcmd                     " display incomplete commands
set foldmethod=manual
set showcmd                     " to see partial commands as you type them
set modelines=3
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2 et   " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set hidden                      " Hide the buffer when switching to another, don't try to save it
set nocursorline
set spelllang=en_us
set listchars=tab:▸\ ,eol:¬,
set laststatus=2                " Always show the statusline
set wildignore+=*.so,*.swp,*.zip,*.pyc
set runtimepath^=~/.vim/bundle/ctrlp.vim
set background=dark
"set t_Co=256
set dir=~/.vim.swaps//,/var/tmp//,/tmp//,.  " Store swp files in a specific location
set rtp+=/usr/local/go/misc/vim


" solarized
let g:solarized_diffmode="high" "default value is normal
let g:solarized_visibility="high" " For :set list
let g:solarized_contrast = "high"
syntax enable
if !has('gui_running')
  let g:solarized_termcolors=&t_Co
  let g:solarized_termtrans=1
endif
colorscheme solarized
"colorscheme desert


let mapleader='\'
let maplocalleader='\\'


" To check for ambiguities:
" :verbose noremap <leader>b
nnoremap <space> ;
nnoremap <leader>ev :e $MYVIMRC<CR>

" Fugitive
noremap <leader>Fc :Gcommit<CR>
noremap <leader>Fp :Gpush<CR>
noremap <leader>Fd :Gdiff<CR>
noremap <leader>Fw :Gwrite<CR>


noremap <silent> <leader>nt :NERDTreeToggle<CR>
" Set the directory of the current file as current dir for NERDtree
noremap <leader>nf :NERDTreeFind<cr> 

noremap <leader>vu :BundleUpdate<cr>

" Cycle to previous buffer nnoremap <leader><leader> <c-^>
nnoremap <leader>f <c-^>

noremap <leader>sc :close<CR>
noremap <leader>sh :sp<CR>
noremap <leader>sv :vsp<CR>

nnoremap <leader>sp :set spell!<CR>

nnoremap <leader>1 :MRU<CR>
nnoremap <leader>2 :!open %<CR>

nnoremap <leader>w :w<CR>

nnoremap <leader>y :Dispatch sh ~/dev/py.analysis/sh/sync_ardmore.sh<CR>

nnoremap <leader>tt :Dispatch! bash ~/Dropbox/git_repo/dotfiles/tmuxtime.sh setup<CR>
nnoremap <leader>ts :Dispatch! bash ~/Dropbox/git_repo/dotfiles/tmuxtime.sh split<CR>
nnoremap <leader>tp :Dispatch! bash ~/Dropbox/git_repo/dotfiles/tmuxtime.sh pis<CR>

nnoremap <leader>q :nohlsearch<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>p :cd %:h<CR>

" Markdown
nnoremap <leader>mc :call QMD_main('compile')<CR>
nnoremap <leader>mo :call QMD_main('open')<CR>
nnoremap <leader>mr :call QMD_main('rsync', 'apu:public_html/markdown')<CR>


" Load todo/GTD
nnoremap <silent> <leader>gd :e $HOME/Dropbox/Documents/GTD/Done.md<CR>
nnoremap <silent> <leader>gs :e $HOME/Dropbox/Documents/GTD/Scratch.md<CR>
nnoremap <silent> <leader>gi :e $HOME/Dropbox/Documents/GTD/Inbox.md<CR>
nnoremap <silent> <leader>gp :e $HOME/Dropbox/Documents/GTD/Progress_Update.md<CR>
nnoremap <silent> <leader>gt :e $HOME/Dropbox/Documents/GTD/Today.md<CR>
nnoremap <silent> <leader>gb :e $HOME/Dropbox/Documents/GTD/Inbox.md<CR>:vsp<CR>:e $HOME/Dropbox/Documents/GTD/Today.md<CR>

nnoremap <leader>ud :w<CR>:Dispatch %<CR>
nnoremap <leader>up :w<CR>:Dispatch python %<CR>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" bash like key for the command line
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" Disable arrow moves and escape (CTRL+C) is better
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap  <Esc>    <NOP>
nnoremap j gj
nnoremap k gk



" Tabs Control
" map H gT
" map L gt


" Copy to the clipboard (mac)
vnoremap <leader>y :w !pbcopy<cr><cr>


highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


augroup vimrc
  autocmd!
  " autocmd BufWritePre * :%s/\s\+$//e
  autocmd FileType make setlocal noexpandtab
  autocmd FileType python set tabstop=4 shiftwidth=4
  autocmd FileType javascript set tabstop=2 shiftwidth=2 et
  autocmd FileType html set tabstop=2 shiftwidth=2 et
  autocmd FileType css set tabstop=2 shiftwidth=2 et
  " Save session
  au BufWinLeave ?* mkview
  au BufWinEnter ?* silent loadview
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup END


au BufRead,BufNewFile *.viki set ft=viki
let vikiNameSuffix=".viki"
let g:vikiOpenUrlWith_http = "silent !firefox %{FILE}"


let g:NERDTreeWinSize = 40
" let g:netrw_preview = 1
" let g:netrw_liststyle = 3
let g:NERDTreeDirArrows=1
let g:NERDTreeChDirMode=2
let NERDTreeIgnore=['\.o$', '\~$', '\.pyc$']
" I want relative numbers in the NERDTree windows
autocmd FileType nerdtree setlocal relativenumber
augroup NerdCursor
  autocmd!
  autocmd BufEnter NERD_tree_* hi CursorLine gui=underline
  autocmd BufLeave NERD_tree_* highlight clear CursorLine
  autocmd BufAdd * highlight clear CursorLine
augroup END


let g:syntastic_javascript_checker = "jshint"
let g:syntastic_auto_loc_list=0
let g:syntastic_enable_signs=1


autocmd BufNewFile,BufReadPost *.go set filetype=go
if has("autocmd") " I want tabs if working with go
  " autocmd BufWritePre * :%s/\s\+$//e
  autocmd FileType go setlocal noexpandtab
endif


let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
" 'r' - the nearest ancestor that contains one of these directories or
"       files: .git .hg .svn .bzr
" 'a' - like c, but only if the current working directory outside of CtrlP is
" not a direct ancestor of the directory of the current file.
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0


nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>


let g:instant_markdown_slow = 1


let MRU_Use_Current_Window = 1
