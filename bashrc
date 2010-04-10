#export PS1='\n\u@\h:\w\n\$ '
export PS1='\[\e[1;30m\][\u@\h \W]\$\[\e[0m\] '

alias todo="mvim $HOME/Dropbox/todo/hgsc/hgsc_p1.viki"
alias scratch="mvim $HOME/Dropbox/Documents/scratch.txt"
alias refresh='. ~/.bashrc'

# Load specific stuff for this machine/user
touch $HOME/.bashrc_for_here
source $HOME/.bashrc_for_here

mkdir -p $HOME/.vim.swaps

export GIT_AUTHOR_NAME="David Rio Deiros"
export GIT_COMMITTER_NAME="David Rio Deiros"
export GIT_AUTHOR_EMAIL="driodeiros@gmail.com"
export GIT_COMMITTER_EMAIL="driodeiros@gmail.com"

# History
# when adding an item to history, delete itentical commands upstream
export HISTCONTROL=erasedups	
# save 10000 items in history
export HISTSIZE=10000		
# append history to ~\.bash_history when exiting shell
shopt -s histappend		
