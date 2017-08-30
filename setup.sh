#! /bin/bash

echo 'cd ~/.tmux'
cd ~/.tmux


echo 'git submodule init'
git submodule init


echo 'git submodule update'
git submodule update





function install_tmux {
    if which tmux > /dev/null
    then
        echo 'tmux has installed'
    else
        if which apt-get > /dev/null
        then
            echo 'sudo apt-get install -y tmux'
                  sudo apt-get install -y tmux
        fi

        if which yum > /dev/null
        then
            echo 'sudo yum     install -y epel-release'
                  sudo yum     install -y epel-release
            echo 'sudo yum     install -y tmux'
                  sudo yum     install -y tmux
        fi

        if which brew > /dev/null
        then
            echo 'brew         install   tmux'
                  brew         install   tmux
        fi
    fi
}

install_tmux





function install_ruby {
    if which ruby > /dev/null
    then
        echo 'ruby has installed'
    else
        if which apt-get > /dev/null
        then
            echo 'sudo apt-get install -y ruby'
                  sudo apt-get install -y ruby
        fi

        if which yum > /dev/null
        then
            echo 'sudo yum     install -y ruby'
                  sudo yum     install -y ruby
        fi

        if which brew > /dev/null
        then
            echo 'brew         install    ruby'
                  brew         install    ruby
        fi
    fi
}

install_ruby





function install_gem {
    if which gem > /dev/null
    then
        echo 'gem has installed'
    else
        if which apt-get > /dev/null
        then
            echo 'sudo apt-get install -y rubygems'
                  sudo apt-get install -y rubygems
        fi

        if which yum > /dev/null
        then
            echo 'sudo yum     install -y rubygems'
                  sudo yum     install -y rubygems
        fi

        if which brew > /dev/null
        then
            echo 'todo'
        fi
    fi
}

install_gem






if which tmuxinator > /dev/null
then
    echo 'tmuxinator has installed'
else
    if [ $(which ruby | grep -c "$HOME") -eq 0 ];
    then
        echo 'sudo gem install tmuxinator'
        sudo gem install tmuxinator
    else
        echo 'gem install tmuxinator'
        gem install tmuxinator
    fi
fi


echo 'cp .tmuxinator.zsh ~/.tmuxinator.zsh'
cp .tmuxinator.zsh ~/.tmuxinator.zsh


echo 'cp .tmux.conf ~/.tmux.conf'
cp .tmux.conf ~/.tmux.conf

tmuxVersion=$(tmux -V | cut -d" " -f2)
echo tmuxVersion $tmuxVersion
if [ "$(echo "$tmuxVersion <= 2.5" | bc -l)" -eq 1 ]
then
    grep -v plugin .tmux.conf > ~/.tmux.conf
fi





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





