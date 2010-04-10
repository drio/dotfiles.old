if has("gui_running")
  "set guifont=Consolas:h10 " Consolas is awesome
  if has("unix")
    set guifont=Monospace\ 8
  endif
  if has("macunix") 
    "set guifont=Monaco:h13
		set anti guifont=Bitstream\ Vera\ Sans\ Mono:h12
    set cursorline
  endif
  if has("win32") 
    set guifont=Lucida_Console:h12:cANSI
  endif

  " set cursorline " highlight current line
  set lines=45
  set columns=100
  set go-=T
  "set noantialias
  colorscheme torte
  set visualbell t_vb=
  set guioptions-=T  "remove toolbar
  set guioptions-=m  "remove menu
  if has("autocmd")
    autocmd GUIEnter * set visualbell t_vb=
  endif
endif

