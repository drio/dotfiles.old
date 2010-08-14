#!/bin/bash
#
set -e

usage="
Usage:\n
  $ `basename $0` [-p <profile_name>] [-h] [-l] \n
  -p load <profile_name> \n
  -l list all profiles available \n
  -h help
\n
"
dist_dir=`dirname $0`

error()
{
  echo $1
  exit 1
}

while getopts ":p:lh" options
do
  case $options in
    p)
      action="load"
      p_name=$OPTARG
      ;;
    l) 
      action="list"
      ;;
    h) 
      echo -ne $usage; exit 0
      ;;
    *) 
      echo -ne $usage; exit 1
      ;;
  esac
done

which screen >/dev/null || error "GNU screen not found."
[ ".$action" == "." ] && echo -ne $usage && exit 0
[ ! -d "$dist_dir/profiles" ] && error "I couldn't find the profiles dir."
if [ $action == "load" ] && [ ! -f "$dist_dir/profiles/screenrc.$p_name" ]
then
  error "Profile name <$p_name> not found."
fi

case $action in
  "list") 
    ls $dist_dir/profiles | sed 's/screenrc.//g'
    ;;
  "load") 
    if [ `echo $STY | awk -F. '{print $2}'` == $p_name ]
    then
      error "You are already in a screen sessino called <$p_name>."
    else
      `screen -S ned -c $dist_dir/profiles/screenrc.$p_name`
    fi
    ;;
  *) 
    error "Incorrect action" 
    ;;
esac
