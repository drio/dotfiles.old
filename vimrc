set nocompatible
syntax on
set paste
set showcmd       " show the command being typed
set number        " Display line numbers
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

" Save these for sessions
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Save the swap files in $HOME/.vim.swaps
set directory=$HOME/.vim.swaps
set backupdir=$HOME/.vim.swaps

" Highlight when searching
set hlsearch

" Scroll Offset (to use with z<CR>)
set scrolloff=1

"source $HOME/.vim/formating.vim
"set list
let loaded_matchparen=1
"set autoindent            " autoindent (should be overwrote by cindent or filetype indent)

set shiftwidth=2          " unify
set tabstop=2             " real tabs should be 4, but they will show with set list on

set copyindent            " but above all -- follow the conventions laid before us
set tw=80                 " Please, lines no longer than 80 characters
"set smarttab
"filetype plugin indent on " load filetype plugins and indent settings

set expandtab             " no real tabs please!
set softtabstop=2         " unify

set preserveindent        " but above all -- follow the conventions laid before us


" For Viki
:autocmd BufNewFile,BufRead,BufEnter *.viki set ft=viki nocompatible
:let vikiNameSuffix=".viki"

set foldenable
"au BufWinLeave * mkview 
"au BufWinEnter * silent loadview

map <F3> ggVGg? " apply rot13 for people snooping over shoulder, good fun
nmap <F8> :w<CR>:!aspell -e --lang=es_ES -c %<CR>:e<CR>
nmap <F4> :w<CR>:!aspell -e -c %<CR>:e<CR>
map <F5> :highlight Comment term=bold cterm=NONE ctermfg=Cyan ctermbg=NONE gui=NONE guifg=#80a0ff guibg=NONE<CR><CR>
map <F6> :highlight Comment term=bold cterm=NONE ctermfg=DarkBlue ctermbg=NONE gui=NONE guifg=#80a0ff guibg=NONE<CR><CR>
map <F7> :set co=120<CR>:set lines=55<CR>
map <C-s> :%s/\s\+$//<CR>

map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

"Change map leader and help me edit some files in current dir
let mapleader=','
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Toggle between displaying special charaters
nmap <leader>l :set list!<CR>

" Help jumping to tabs
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

