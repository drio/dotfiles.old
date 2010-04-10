if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

#--------------------------
# Aliases
#--------------------------
alias todo="mvim $HOME/Dropbox/todo/hgsc/hgsc_p1.viki"
alias scratch="mvim $HOME/Dropbox/Documents/scratch.txt"
alias pscpu="ps -aeo pcpu,pid,user,command | sort -k 1 -r | head -10"
alias backup='cd /Users && time rsync -av --progress --exclude="Video" --exclude="Incomplete" --exclude="watch" ./drio /Volumes/wdbackup/'
alias windows='cd /driostuff/qemu/ && qemu -boot c -hda hdds/xp.img -m 256'
alias rxvt="rxvt +sb -fg white -si -sk -bg black -fn 10x20 -cr yellow -ls"
alias bw="sudo /Users/drio/scripts/checkBW.pl"
alias fetchmail='fetchmail -a -m "/usr/bin/procmail -d %T"'
alias background="display -window root /Users/drio/Pictures/backgrounds/skysong2.jpg"
alias matrix="xscreensaver-command -activate"
alias la="export TZ=:/usr/share/zoneinfo/America/Los_Angeles && date && unset TZ"
alias bcn="export TZ=:/usr/share/zoneinfo/Europe/Madrid && date && unset TZ"
alias horas="xplanet -window -latitude 20 -longitude -49 -target earth -config default -wait 300 -label -labelpos +15-15 -color white -fontsize 14 -radius 50 -range 10 -starmap ./stars/BSC &>/dev/null &"
alias mailstat='mailstat /Users/drio/Procmail/pm.log'
alias bigfiles="find . -follow -type f -print0 | xargs -0 ls -l |sort -r -n -k 5,5 | head -n 15"
alias setId='echo "svn propset svn:keywords Id "'
alias mailruby="aterm -fg white -bg black -fn 9x15 +sb -geometry 80x47+155+2 -e screen -c $HOME/.screenrc.mail.ruby"
alias myaterm="aterm -fg white -bg black -fn 9x15 +sb -geometry 80x47+155+2"
alias generate_password="openssl rand -base64 6 | pbcopy && pbpaste"
#alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &'
#alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown'
#alias t="todo.sh && wc $HOME/Documents/todo/todo.txt"
#alias mp3tocd="sudo mp3burn -o \"-v dev=ATAPI:0,0,0\" ./*.mp3'
#alias mailConsole="cd $HOME/Mail/Console && rsync -e 'ssh -p 2222' -avz localhost:Mail/* ."
if [ `uname` == 'Darwin' ]
then
  alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
fi

#--------------------------
# Functions
#--------------------------
function rversion() { # Switch between ruby versions
  r_local="$HOME/local/ruby_local"
  rm -rf $r_local && mkdir $r_local && cd $r_local

  case "$1" in
    '8')
      version="ruby1.8"
      l_dirs="bin lib share"
      ;;
    '9')
      version="ruby1.9"
      l_dirs="bin include lib share"
      ;;
    *)
      echo "8 or 9 ?"
      ;;
  esac

  for d in $l_dirs
  do
    echo "linking $version/$d"
    ln -s ../$version/$d .
  done
  cd - > /dev/null
}

error() {
  echo $1 && exit
}

function new_account { 

  [ ".$1" == "." ] && error "Please introduce machine name"
  machine=$1

  tmp_dir="/tmp/`openssl rand -base64 10`"
  mkdir -p $tmp_dir/

  # get the files I want to copy to the machine
  cp $HOME/.ssh/*.pub $tmp_dir/
  for f in .vimrc .bashrc;do
    cp $HOME/.bashrc $tmp_dir/
    cp $HOME/.vimrc $tmp_dir/
  done

  # Let's first copy and create the authorized_keys
  scp $tmp_dir/* $machine:.
  ssh $machine "mkdir -p ./.ssh && cat *.pub >> .ssh/authorized_keys && rm -f *.pub"

  # Let's transfer the rest of files
  for f in .vimrc .bashrc;do
    scp $tmp_dir/$f $machine:.
  done

  rm -rf $tmp_dir
}

function enctips {

cat <<-EOF

$ cat ./file.txt
my secret is here
$ openssl enc -aes-256-cbc -a -salt -in file.txt -out file.enc
enter aes-256-cbc encryption password:
Verifying - enter aes-256-cbc encryption password:

$ cat file.enc
U2FsdGVkX185NvtIU3W21kMOo5VN5QTxY7ST3GtFcfJ0WxbQ+0+b2lBLxFmIUYjZ
$ openssl enc -d -aes-256-cbc -a -in file.enc
enter aes-256-cbc decryption password:

my secret is here

$
EOF
}

function encfile {
  openssl enc -aes-256-cbc -a -salt -in $1 -out $1.enc
}

function decfile {
  openssl enc -d -aes-256-cbc -a -in $1
}

function helpsvn {
cat <<-EOF
  L     some_dir            # svn left a lock in the .svn area of some_dir
M       bar.c               # the content in bar.c has local modifications
 M      baz.c               # baz.c has property but no content modifications
X       3rd_party           # dir is part of an externals definition
?       foo.o               # svn doesn't manage foo.o
!       some_dir            # svn manages this, but it's missing or incomplete
~       qux                 # versioned as file/dir/link, but type has changed
I       .screenrc           # svn doesn't manage this, and is set to ignore it
A  +    moved_dir           # added with history of where it came from
M  +    moved_dir/README    # added with history and has local modifications
D       stuff/fish.c        # file is scheduled for deletion
A       stuff/loot/bloo.h   # file is scheduled for addition
C       stuff/loot/lump.c   # file has textual conflicts from an update
 C      stuff/loot/glub.c   # file has property conflicts from an update
R       xyz.c               # file is scheduled for replacement
    S   stuff/squawk        # file or dir has been switched to a branch
     K  dog.jpg             # file is locked locally; lock-token present 
     O  cat.jpg             # file is locked in the repository by other user
     B  bird.jpg            # file is locked locally, but lock has been broken
     T  fish.jpg            # file is locked locally, but lock has been stolen
EOF
}

function encrypt {
  if [ "$1" = "." ];then
	  echo
	  echo Syntax: encrypt INPUTFILE
	  exit
  fi
  echo "Encoding $1 ..."
  gpg -a -r drio --output "$1".gpg --encrypt $1
  echo "Done."
}

function decrypt {
	if [ "$1" = "." ];then
		echo
		echo "Syntax: decrypt INPUTFILE"
		exit
	fi
	ext=${1##*.}
	if [ "$ext" != "gpg" ];then
		echo "Incorrect extension"
		exit
	fi
	echo "deconding $1 ..."
	gpg -r drio --output `basename $1 .gpg` --decrypt $1
	echo "Done."
}

function catcrypt {
	decrypt $1
	echo
	echo ----
	cat `basename $1 .gpg`
	echo ----
	echo
	rm -f $1
	encrypt `basename $1 .gpg`
	rm -f `basename $1 .gpg`
}

#-----------------------------------
# PATH
#-----------------------------------
MY_RUBY_OSX="$HOME/local/ruby_local/bin"
MAC_PORTS="/opt/local/bin"
HOME_LOCAL="$HOME/local/bin"
GIT_OSX="/usr/local/git/bin"
BASIC="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/lib"
export PATH="$MY_RUBY_OSX:$MAC_PORTS:$HOME_LOCAL:$GIT_OSX:$BASIC:$PATH"

#----------------------------------
# HGSC
#----------------------------------
if [ ".`id | egrep "p-solid|sol-pipe"`" != "." ]
then
  export PATH=".:/users/sol-pipe/myEnv/local/bin:/users/sol-pipe/myEnv/perl/bin:/users/sol-pipe/myEnv/ruby/bin:/users/sol-pipe/myEnv/git/bin:/data/solid_analysis/corona_lite_v0.31/bin:/users/sol-pipe/local/bin:/users/p-solid/local/bin:/usr/bin:/usr/lib:/usr/local/bin:/opt/local/bin:/usr/share/lsf/6.2/linux2.6-glibc2.3-x86_64/etc:/usr/share/lsf/6.2/linux2.6-glibc2.3-x86_64/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/ncbi:/usr/local/blatSuite:/usr/local/genome/bin:/Users/drio/tmp/synergy/bin:/users/p-solid/scripts:/usr/local/sbin/:/usr/local/bin:/Users/drio/rubypm/trunk/ruby:/home/drio/dev/git_repo/solid_reports:/users/sol-pipe/local/bin:/home/drio/454/rig-1.1.01.20_32bit/bin:/data/solid_analysis/hgsc_solid/bin:/users/p-solid/para_srf/bin:/data/solid_analysis/hgsc_solid/bin"

  # HGSC_slx pipeline
  export HGSC_SLX=/data/slx/goats/hgsc_slx 
  export PATH=$PATH:/data/slx/goats/hgsc_slx/bin:/data/slx/goats/hgsc_slx/third_party
  # rig tools
  export PATH="$PATH:/data/users/mholder/rig_1.1.03.19_64bit/bin"
  # blat 
  export PATH="$PATH:$HOME/bin/x86_64"
  export PATH="$PATH:$HOME/.drio/src/bio_tools/bin"
  # amos
  export PATH="$PATH:/users/sol-pipe/.drio/src/bio_tools/amos-2.0.4/bin"
  export PATH="$PATH:/users/sol-pipe/.drio/src/pipeliner"

  export CORONA_VERSION="0.31"
  export HGSC_SOLID="/data/solid_analysis/hgsc_solid"
  export CORONAROOT="/data/solid_analysis/corona_lite_v$CORONA_VERSION"
  export PERL5LIB="/data/solid_analysis/corona_lite_v0.31/lib/perl"
  source $CORONAROOT/etc/profile.d/corona.sh
fi

#-----------------------------------
# Misc
#-----------------------------------
export LC_CTYPE=en_US
export LANG=en_US
export LC_ALL=en_US
export EDITOR=vim
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export HISTFILESIZE=1000000000
export HISTSIZE=1000000

# bash history stuff
shopt -s histappend
export PROMPT_COMMAND="history -a"
export HISTCONTROL="ignoredups"
export HISTIGNORE="&:ls:[bf]g:exit"

# Colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Ruby
export RUBYLIB="$HOME/local/rubytorrent-0.3"

# Make Bash append rather than overwrite the history on disk:
shopt -s histappend
# Whenever displaying the prompt, write the previous line to disk:
PROMPT_COMMAND='history -a'

# In case we have keychain
#if [ -f "/opt/local/bin/keychain" ];then
  #/opt/local/bin/keychain --quiet ~/.ssh/id_rsa
  #. ~/.keychain/${HOSTNAME}-sh
#fi

# Accidental exiting
export IGNOREEOF=2

#-----------------------------------------
# Load specific stuff for this machine/user
#-----------------------------------------
touch $HOME/.bashrc_for_here
source $HOME/.bashrc_for_here

# Source amazon stuff if there
[ -f $HOME/.ec2/amazon_bash.sh ] && source $HOME/.ec2/amazon_bash.sh

#---------------------------
# Scratch area
#---------------------------
# mpage -2 flashdist.sh | lpr -Php6mp
# gpg -a -c pepe.txt
# gpg -a --decrypt file
# gpg --print-md sha1 .config
# vim /Users/drio/Library/Logs/CrashReporter/Quicksilver.crash.log
# Get keychain passwords: security dump-keychain -d ~/Library/Keychains/login.keychain
# /Developer/Applications/Utilities

mkdir -p $HOME/.vim.swaps

# Git stuff

export GIT_AUTHOR_NAME="David Rio Deiros"
export GIT_COMMITTER_NAME="David Rio Deiros"
export GIT_AUTHOR_EMAIL="driodeiros@gmail.com"
export GIT_COMMITTER_EMAIL="driodeiros@gmail.com"

