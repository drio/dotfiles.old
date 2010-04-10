"au VimLeave * call VimLeave()
"au VimEnter * call VimEnter()
let g:PathToSessions = $HOME . "/.vim/sessions/"

function! VimEnter()
  if argc() == 0
    " gvim started with no files
    if has("browse") == 1
      let g:SessionFileName = browse(0, "Select Session", g:PathToSessions, g:PathToSessions . "LastSession.vim")
      if g:SessionFileName != ""
        exe "source " . g:SessionFileName
      endif
    else
      " For non-gui vim
      let LoadLastSession = confirm("Restore last session?", "&Yes\n&No")
      if LoadLastSession == 1
        exe "source " . g:PathToSessions . "LastSession.vim"
      endif
    endif
  endif
endfunction

function! VimLeave()
  exe "mksession! " . g:PathToSessions . "LastSession.vim"
  if exists("g:SessionFileName") == 1
    if g:SessionFileName != ""
      exe "mksession! " . g:SessionFileName
    endif
  endif
endfunction
" A command for setting the session name
"com -nargs=1 SetSession :let g:SessionFileName = g:PathToSessions . <args> . ".vim"
" .. and a command to unset it
"com -nargs=0 UnsetSession :let g:SessionFileName = ""
