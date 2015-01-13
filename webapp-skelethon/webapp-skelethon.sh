#!/bin/bash

s_dir=$( cd $(dirname $0) ; pwd -P )
cp -r $s_dir/bootstrap/* .
git init 
git add *
git commit -a -m 'First import.'
