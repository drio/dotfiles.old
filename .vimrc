" Let Pathogen to its magic {{{
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
call pathogen#infect() " for coffeescript stuff...
" }}}


" Basics {{{
set nu
set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set foldmethod=manual
set showcmd                     " to see partial commands as you type them

" syntax highlight
"
" let g:solarized_diffmode="high" "default value is normal
" let g:solarized_visibility="normal" " For :set list
syntax enable
set t_Co=256
set background=dark
if !has('gui_running')
  let g:solarized_termcolors=&t_Co
  let g:solarized_termtrans=1
endif
colorscheme solarized
"colorscheme desert


" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set hidden                      " Hide the buffer when switching to another, don't try to save it
"}}}

" Mappings {{{
let mapleader='\'
let maplocalleader='\'
" Toggle between displaying special charaters
nmap <leader>l :set list!<CR>
" Change directory to path of current file
nmap <leader>p :cd %:h<CR>

" spelling options
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us

" Move around windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

" Disable arrow moves
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Load todo
map <silent> <leader>t :e $HOME/Dropbox/todo/todo.viki<CR>

" to reselect the text that was just pasted so I can perform commands
" (like indentation) on it
nnoremap <leader>v V`]

" Easy jumping and selecting over block of code
map <Space> %

" If in macvim, make the window take the full screen
nmap <leader>f :set columns=400<CR>:set lines=300<CR>

" Cycle to previous buffer
nnoremap <leader><leader> <c-^>

" Tabs Control
" map H gT
" map L gt
map <silent> <leader>n :tabnew<Cr>
map <silent> <leader>c <C-w>c
map <silent> <leader>q ZQ

" Show a read line at 80c
nmap <leader>H :set colorcolumn=80 <CR>
nmap <leader>h :set colorcolumn=0 <CR>

" Toggle between displaying line numbers
nmap <leader>n :set number!<CR>

" Set the directory of the current file as current dir for NERDtree
map <leader>r :NERDTreeFind<cr>
"}}}


" Autocmd {{{
if has("autocmd")
  " remove trailing spaces
  autocmd BufWritePre * :%s/\s\+$//e
  " No expandtab when working with Makefiles
  autocmd FileType make setlocal noexpandtab
  " Save session
  au BufWinLeave ?* mkview
  au BufWinEnter ?* silent loadview
endif
"}}}

" Viki plugin {{{
au BufRead,BufNewFile *.viki set ft=viki
let vikiNameSuffix=".viki"
let g:vikiOpenUrlWith_http = "silent !firefox %{FILE}"
"}}}

" NERDtree {{{
map <silent> <leader>g1 :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 30
" List current dir (Vertical split)
map <silent> <leader>e :Vex<CR>
" let g:netrw_preview = 1
"let g:netrw_liststyle = 3
"let g:netrw_winsize = 40
"}}}

" Store swp files in a specific location
set dir=~/.vim.swaps//,/var/tmp//,/tmp//,.

" Syntastic plugings configs {{{
let g:syntastic_javascript_checker = "jshint"
let g:syntastic_auto_loc_list=0
" }}}
let g:syntastic_enable_signs=1

" Go
" {{{
set rtp+=/usr/local/go/misc/vim
" syntax on
autocmd BufNewFile,BufReadPost *.go set filetype=go
if has("autocmd") " I want tabs if working with go
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd FileType go setlocal noexpandtab
endif
" }}}

" ctrlp
" {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*.so,*.swp,*.zip,*.pyc
let g:ctrlp_working_path_mode = 'ra'
" }}}
