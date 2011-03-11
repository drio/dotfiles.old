parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h:\w *\`parse_git_branch\`*$ "
export EDITOR="vim"

alias todo="vim $HOME/Dropbox/todo/hgsc/hgsc_p1.viki"
alias pomo="vim $HOME/Dropbox/todo/hgsc/pomodoro.viki"
alias personal="vim $HOME/Dropbox/todo/hgsc/personal.viki"
alias scratch="vim $HOME/Dropbox/Documents/scratch.txt"
alias notes="vim $HOME/Dropbox/Documents/notes.txt"
alias refresh='. ~/.bashrc'
alias ruby_scratch="mvim $HOME/Dropbox/Documents/scratch.rb"
alias vim_notes="mvim $HOME/Dropbox/the_knowledge_pool/vim.txt"
alias tmux_notes="mvim $HOME/Dropbox/the_knowledge_pool/tmux.txt"

# Load screen_stuff
export PATH=$PATH:$HOME/.screen_loader

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

# EC2
#export AWS_IAM_HOME=$HOME/ec2/IAM-cli
#export AWS_CREDENTIAL_FILE=$AWS_IAM_HOME/drio_cred.txt
export EC2_HOME=$HOME/ec2/ec2-api-tools-1.4.0.2
export JAVA_HOME=/Library/Java/Home
export EC2_PRIVATE_KEY=~/.ec2/pk-IGD2V6RDMFYFPMJTPPCZAAZ5NSWXXY4N.pem
export EC2_CERT=~/.ec2/cert-IGD2V6RDMFYFPMJTPPCZAAZ5NSWXXY4N.pem
export PATH=$PATH:$EC2_HOME/bin
