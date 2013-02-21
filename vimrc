" Init {{{
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
" }}}

" Settings {
set nocompatible
"set background=dark
"colors blackboard
"colors darkblue
syntax on
"set enc=utf-8
"set fenc=utf-8
"set termencoding=utf-8
"set paste
set showcmd       " show the command being typed
"set number        " Display line numbers
set numberwidth=6 " When using set number, setup the # of columns to save for line number
set lazyredraw    " do not redraw while running macros (much faster) (LazyRedraw)
set noerrorbells  " don't make noise
set scrolloff=5   " Keep 5 lines (top/bottom) for scope
set sidescrolloff=5  " Keep 5 lines at the size
set novisualbell    " don't blink
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set laststatus=2
set hidden        " Hide the buffer when switching to another, don't try to save it
set ruler
"set relativenumber
"set undofile
set ttyfast
set tw=79
set nu
set vb " no beeping

" Save these for sessions
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Save the swap files in $HOME/.vim.swaps
set nobackup
set noswapfile
set nowritebackup
" set directory=$HOME/.vim.swaps
"set backupdir=$HOME/.vim.swaps

" Detect filetypes
filetype plugin indent on
" Specific filetypes settings

" Autocmd
if has("autocmd")
  " remove trailing spaces
  autocmd BufWritePre * :%s/\s\+$//e
  " No expandtab when working with Makefiles
  autocmd FileType make setlocal noexpandtab
endif

" Highlight when searching
set hlsearch

" Scroll Offset (to use with z<CR>)
set scrolloff=1

let loaded_matchparen=1
"set autoindent            " autoindent (should be overwrote by cindent or filetype indent)

set shiftwidth=2          " unify
set tabstop=2             " real tabs should be 4, but they will show with set list on

set copyindent            " but above all -- follow the conventions laid before us
set tw=80                 " Please, lines no longer than 80 characters
"set smarttab
filetype plugin indent on " load filetype plugins and indent settings

set expandtab             " no real tabs please!
set softtabstop=2         " unify

set preserveindent        " but above all -- follow the conventions laid before us
" }}}

" Save folds
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" For Viki
au BufRead,BufNewFile *.viki set ft=viki
let vikiNameSuffix=".viki"
let g:vikiOpenUrlWith_http = "silent !firefox %{FILE}"
" END Viki

set foldenable
set foldmethod=manual
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

map <F3> ggVGg? " apply rot13 for people snooping over shoulder, good fun
nmap <F8> :w<CR>:!aspell -e --lang=es_ES -c %<CR>:e<CR>
nmap <F4> :w<CR>:!aspell -e -c %<CR>:e<CR>
map <F5> :highlight Comment term=bold cterm=NONE ctermfg=Cyan ctermbg=NONE gui=NONE guifg=#80a0ff guibg=NONE<CR><CR>
map <F6> :highlight Comment term=bold cterm=NONE ctermfg=DarkBlue ctermbg=NONE gui=NONE guifg=#80a0ff guibg=NONE<CR><CR>
map <C-s> :%s/\s\+$//<CR>
map <C-s> :%s/\s\+$//<CR>

map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

"nnoremap <C-n> :bnext<CR>
"nnoremap <C-p> :bprevious<CR>

"Change map leader and help me edit some files in current dir
let mapleader=','
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Toggle between displaying special charaters
nmap <leader>l :set list!<CR>
" Toggle between displaying line numbers
nmap <leader>n :set number!<CR>
" Change directory to path of current file
nmap <leader>c :cd %:h<CR>

" Help jumping to tabs
map <D-S-]> gt
map <D-S-[> gT

" Move around windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" makes it easy to clear out a search by typing ,<space>
nnoremap <leader><space> :noh<cr>
" make the tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %
" These lines manage my line wrapping settings and also show a colored column at 85
" characters (so I can see when I write a too-long line of code).
set wrap
set textwidth=79
set formatoptions=qrn1
"set list
"set listchars=tab:▸\ ,eol:¬
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

" get rid of that stupid goddamned help key that you will invaribly hit constantly
" while aiming for escape
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" to reselect the text that was just pasted so I can perform commands
" (like indentation) on it
nnoremap <leader>v V`]

" quickly open up my ~/.vimrc file in a vertically split window so I can add new
" things to it on the fly
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Ack
nnoremap <leader>a :Ack

" Toggle Rainbow
nnoremap <leader>R :RainbowParenthesesToggle<CR>

set colorcolumn=0

" spelling options
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us

" edit my todo
"nmap <silent> <leader>t :e $HOME/Dropbox/todo/hgsc/hgsc_p1.txt<CR>
nmap <silent> <leader>t :e $HOME/Dropbox/todo/todo.viki<CR>
"nmap <silent> <leader>d :e $HOME/Dropbox/todo/hgsc/done.txt<CR>

" clear search
nmap <silent> ,/ :nohlsearch<CR>

" NERDtree {{{
map <silent> <leader>g1 :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 35

" List current dir (Vertical split)
map <silent> <leader>e :Vex<CR>
" let g:netrw_preview = 1
"let g:netrw_liststyle = 3
"let g:netrw_winsize = 40
map <silent> <leader>h :hide<CR>

" Easy jumping and selecting over block of code {{{
map <Space> %
"   }}}

" Bit window
nmap <leader>f :set columns=400<CR>:set lines=300<CR>

"set tags=/Users/drio/tmp/wiki/tags;./tags;tags;/.
"autocmd BufWritePost /Users/drio/tmp/wiki/*
"helptags /Users/drio/tmp/wiki

" ctrlp plugin stuff
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/*.o   " for Linux/MacOSX
let g:ctrlp_working_path_mode = 1  " 1 - the parent directory of the current file.
