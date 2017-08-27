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


if [ -e ~/.tmux.conf ]
then
    grepResult=$(cat ~/.tmux.conf | grep '^source .*\/powerline\/bindings\/tmux\/powerline\.conf')
    echo ~/.tmux.conf $grepResult
    if [ ${#grepResult} == 0 ]
    then
        if which pip > /dev/null
        then
            powerline_file=$(pip show powerline-status | awk '/Location:/{print $2 "/powerline/bindings/tmux/powerline.conf"}')
            if [ -e $powerline_file ]
            then
                echo "source '$powerline_file'" >> ~/.tmux.conf
            fi
        fi
    fi

    echo $'cat ~/.tmux.conf | grep $'^source .*\/powerline\/bindings\/tmux\/powerline\.conf''
    cat ~/.tmux.conf | grep '^source .*\/powerline\/bindings\/tmux\/powerline\.conf'
fi





