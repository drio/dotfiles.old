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
"set ignorecase            " case insensitive by default
"set smartcase             " if there are caps, go case-sensitive
" set shiftround          " when at 3 spaces, and I hit > ... go to 4, not 5
" set nowrap              " do not wrap line
" set cursorcolumn        " show the current column

autocmd BufEnter *.viki set filetype=viki
