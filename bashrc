PS1='\[\033[00;32m\]\u\[\033[01m\]@\[\033[00;36m\]\h\[\033[01m\]:\[\033[00;35m\]\w\[\033[00m\]\[\033[01;30m\](`git branch 2>/dev/null|tr -d \*\ `)\[\033[00m\]\$ '

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
