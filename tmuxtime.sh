#!/bin/sh
#
SESSION=0

if [ $1 == "setup" ]
then
  #  vim
  vim_window=$(tmux list-window -t $SESSION: | grep vim | awk -F: '{print $1}')
  if [ ".$vim_window" == "." ];then
    echo "+ Creating vim window ..."
    tmux new-window -n vim -t $SESSION:
    tmux send-keys -t $SESSION:$ardmore 'vim' C-m
  fi

  # ardmore
  ard_window=$(tmux list-window -t $SESSION: | grep ardmore | awk -F: '{print $1}')
  if [ ".$ard_window" != "." ];then
    echo "+ Killing ardmore window ..."
    tmux kill-window -t $SESSION:$ard_window
  fi
  tmux new-window -n ardmore -t $SESSION:
  ard_window=$(tmux list-window -t $SESSION: | grep ardmore | awk -F: '{print $1}')
  tmux send-keys -t $SESSION:$ardmore 'vpn' C-m

  # mutt/irssi
  irssi_window=$(tmux list-window -t $SESSION: | grep irssi | awk -F: '{print $1}')
  if [ ".$irssi_window" == "." ];then
    echo "+ Creating irssi window..."
    tmux new-window -n irssi -t $SESSION:
    irssi_window=$(tmux list-window -t $SESSION: | grep irssi | awk -F: '{print $1}')
    tmux split-window -h -t $SESSION:$irssi_window
    tmux send-keys -t $SESSION:$irssi_window.0 'mutt' C-m
    tmux send-keys -t $SESSION:$irssi_window.1 'ssh -t is tmux a' C-m
    tmux split-window -v -t $SESSION:$irssi_window.1
  fi

  # Go to the vim window
  vim_window=$(tmux list-window -t $SESSION: | grep vim | awk -F: '{print $1}')
  tmux select-window -t $SESSION:$vim_window
fi

if [ $1 == "split" ]
then
  vim_window=$(tmux list-window -t $SESSION: | grep vim | awk -F: '{print $1}')
  tmux split-window -t $SESSION:$vim_window
  tmux resize-pane -t $SESSION:$vim_window.1 -y 10
fi

if [ $1 == "pis" ]
then
  pis_window=$(tmux list-window -t $SESSION: | grep pis | awk -F: '{print $1}')
  if [ ".$irssi_window" == "." ];then
    echo "+ Creating pis window..."
    tmux new-window -n pis -t $SESSION:
    pis_window=$(tmux list-window -t $SESSION: | grep pis | awk -F: '{print $1}')
    tmux split-window -h -t $SESSION:$pis_window
    tmux send-keys -t $SESSION:$pis_window.0 'ssh -t pi@192.168.1.109 tmux a' C-m
    tmux send-keys -t $SESSION:$pis_window.1 'ssh -t  -c aes256-ctr pi@192.168.1.132  tmux a' C-m
    # Go to the vim window
    vim_window=$(tmux list-window -t $SESSION: | grep vim | awk -F: '{print $1}')
    tmux select-window -t $SESSION:$vim_window
  fi
fi
