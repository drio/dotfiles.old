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

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" Save these for sessions
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Save the swap files in $HOME/.vim.swaps
set directory=$HOME/.vim.swaps
set backupdir=$HOME/.vim.swaps

" Highlight when searching
set hlsearch

" Scroll Offset (to use with z<CR>)
set scrolloff=1
