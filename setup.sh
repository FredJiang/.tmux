#! /bin/bash

echo 'cd ~/.tmux'
cd ~/.tmux


echo 'git submodule init'
git submodule init


echo 'git submodule update'
git submodule update


if which tmuxinator > /dev/null
then
    echo 'tmuxinator has installed'
else
    echo 'sudo gem install tmuxinator'
    sudo gem install tmuxinator
fi


echo 'cp .tmuxinator.zsh ~/.tmuxinator.zsh'
cp .tmuxinator.zsh ~/.tmuxinator.zsh


echo 'cp .tmux.conf ~/.tmux.conf'
cp .tmux.conf ~/.tmux.conf


echo 'tmux source ~/.tmux.conf'
tmux source ~/.tmux.conf


if [ -e ~/.zshrc ]
then
    grepResult=$(cat ~/.zshrc | grep '^export EDITOR="vim"')
    echo ~/.zshrc $grepResult
    if [ ${#grepResult} == 0 ]
    then
        echo 'export EDITOR="vim"'     >> ~/.zshrc
    fi

    grepResult=$(cat ~/.zshrc | grep '^source ~/.tmuxinator.zsh')
    echo ~/.zshrc $grepResult
    if [ ${#grepResult} == 0 ]
    then
        echo 'source ~/.tmuxinator.zsh' >> ~/.zshrc
    fi

    echo $'cat ~/.zshrc | grep \'^export EDITOR="vim"\''
    cat ~/.zshrc | grep '^export EDITOR="vim"'

    echo $'cat ~/.zshrc | grep \'^source ~/.tmuxinator.zsh\''
    cat ~/.zshrc | grep '^source ~/.tmuxinator.zsh'

    /bin/zsh -c 'source ~/.zshrc'
fi


if [ ! -e ~/.vimrc ]
then
    echo 'wget "https://raw.githubusercontent.com/FredJiang/.vim/master/.vimrc" -O ~/.vimrc'
    wget "https://raw.githubusercontent.com/FredJiang/.vim/master/.vimrc" -O ~/.vimrc
fi



