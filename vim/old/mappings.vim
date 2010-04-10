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

" Tabs
" map <C-t> :tabnew<CR>
map <C-left> :tabp<CR>
map<C-right> :tabn<CR>

" Open session for todo list
map <C-H> :source $HOME/Dropbox/todo/vim.todo.session<CR>
