#!/bin/bash
#
set -e

rm -f $HOME/.bashrc $HOME/.vimrc $HOME/.gvimrc $HOME/.screenrc
rm -rf $HOME/vim $HOME/.screen_loader

cp bashrc $HOME/.bashrc
cp vimrc $HOME/.vimrc
cp gvimrc $HOME/.gvimrc
cp screenrc $HOME/.screenrc
cp -r vim $HOME/
cp -r screen_loader $HOME/.screen_loader
