parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PATH=$PATH:/usr/local/bin:/bin

export PS1="\u@\h:\w *\`parse_git_branch\`*$ "
export EDITOR="vim"

# Load screen_stuff
export PATH=$PATH:/usr/bin

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

# Load specific stuff for this machine/user
touch $HOME/.bashrc_for_here
source $HOME/.bashrc_for_here

export NODE_PATH="/usr/local/lib/node_modules"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
