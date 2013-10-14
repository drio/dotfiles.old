parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#echo $PATH > $HOME/.before_bashrc
unset PATH
export PATH=/usr/local/bin:/bin

export PS1="\u@\h:\w *\`parse_git_branch\`*$ "
export EDITOR="vim"

alias gonotes="vim $HOME/Dropbox/Documents/gonotes.viki"
alias todo="vim $HOME/Dropbox/todo/todo.viki"
alias done="vim $HOME/Dropbox/todo/hgsc/done.txt"
alias ptodo="vim $HOME/Dropbox/todo/hgsc/personal_todo.txt"
alias personal="vim $HOME/Dropbox/todo/hgsc/personal.viki"
alias scratch="vim $HOME/Dropbox/Documents/scratch.txt"
alias notes="vim $HOME/Dropbox/Documents/notes.txt"
alias refresh='. ~/.bashrc'
alias ruby_scratch="mvim $HOME/Dropbox/Documents/scratch.rb"
alias vim_notes="vim $HOME/Dropbox/the_knowledge_pool/vim.txt"
alias tmux_notes="mvim $HOME/Dropbox/the_knowledge_pool/tmux.txt"
alias to_tab="ruby -ane \'puts $F.join(\"\t\")\'"
alias format='find . -name "*.go" | gxargs -i echo "gofmt -tabs=false -tabwidth=2 {} > {}.fix; mv {}.fix {}"'
alias gitp='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'

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
