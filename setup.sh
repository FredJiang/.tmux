#! /bin/bash

echo 'cd ~/.tmux'
cd ~/.tmux
echo 'pwd' `pwd`

echo 'git submodule init'
git submodule init

echo 'git submodule update'
git submodule update

cp .tmux.conf ~/.tmux.conf

tmux source ~/.tmux.conf