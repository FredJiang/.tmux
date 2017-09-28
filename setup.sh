#! /bin/bash


function echoCo {
    echo -e "\033[32m$@\033[0m"
}


function echoMe {
    echo -e "\033[35m$@\033[0m"
}


echoCo  git pull
        git pull


echoCo  git submodule init
        git submodule init


echoCo  git submodule update
        git submodule update


echoCo  cd ~/.tmux
        cd ~/.tmux


function install_tmux {
    if which tmux > /dev/null; then
        echoMe tmux has installed
    else
        if which apt-get > /dev/null; then
            echoCo  sudo apt-get install -y tmux
                    sudo apt-get install -y tmux
        fi

        if which yum > /dev/null; then
            echoCo  sudo yum     install -y epel-release
                    sudo yum     install -y epel-release
            echoCo  sudo yum     install -y tmux
                    sudo yum     install -y tmux
        fi

        if which brew > /dev/null; then
            echoCo  brew         install    tmux
                    brew         install    tmux
        fi
    fi
}


install_tmux


function install_ruby {
    if which ruby > /dev/null; then
        echoMe 'ruby has installed'
    else
        if which apt-get > /dev/null; then
            echoCo  sudo apt-get install -y ruby
                    sudo apt-get install -y ruby
        fi

        if which yum > /dev/null; then
            echoCo  sudo yum     install -y ruby
                    sudo yum     install -y ruby
        fi

        if which brew > /dev/null; then
            echoCo  brew         install    ruby
                    brew         install    ruby
        fi
    fi
}


install_ruby


function install_gem {
    if which gem > /dev/null; then
        echoMe 'gem has installed'
    else
        if which apt-get > /dev/null; then
            echoCo  sudo apt-get install -y rubygems
                    sudo apt-get install -y rubygems
        fi

        if which yum > /dev/null; then
            echoCo  sudo yum     install -y rubygems
                    sudo yum     install -y rubygems
        fi

        if which brew > /dev/null; then
            echoMe 'todo'
        fi
    fi
}


install_gem


if which tmuxinator > /dev/null; then
    echoMe 'tmuxinator has installed'
else
    if [ $(which ruby | grep -c "$HOME") -eq 0 ]; then
        echoCo  sudo gem install tmuxinator
                sudo gem install tmuxinator
    else
        echoCo       gem install tmuxinator
                     gem install tmuxinator
    fi
fi


echoCo 'cp ~/.tmux/.tmuxinator.zsh ~/.tmuxinator.zsh'
        cp ~/.tmux/.tmuxinator.zsh ~/.tmuxinator.zsh


echoCo 'cp ~/.tmux/.tmux.conf ~/.tmux.conf'
        cp ~/.tmux/.tmux.conf ~/.tmux.conf


tmuxVersion=$(tmux -V | cut -d" " -f2)
echoMe tmuxVersion $tmuxVersion
if [ "$(echo "$tmuxVersion <= 2.5" | bc -l)" -eq 1 ]; then
    echoCo  grep -v plugin .tmux.conf > ~/.tmux.conf
            grep -v plugin .tmux.conf > ~/.tmux.conf
fi


echoCo  tmux source ~/.tmux.conf
        tmux source ~/.tmux.conf


if [ -e ~/.zshrc ]; then
    echoCo       cat ~/.zshrc \| grep '^export EDITOR="vim"'
    grepResult=$(cat ~/.zshrc  | grep '^export EDITOR="vim"')
    if [ ${#grepResult} == 0 ]; then
        echoCo  echo 'export EDITOR="vim"'     \>\> ~/.zshrc
                echo 'export EDITOR="vim"'     >>   ~/.zshrc
    fi

    echoCo       cat ~/.zshrc \| grep '^source ~/.tmuxinator.zsh'
    grepResult=$(cat ~/.zshrc  | grep '^source ~/.tmuxinator.zsh')
    if [ ${#grepResult} == 0 ]; then
        echoCo  echo 'source ~/.tmuxinator.zsh' \>\> ~/.zshrc
                echo 'source ~/.tmuxinator.zsh' >>   ~/.zshrc
    fi

    echoCo  cat ~/.zshrc \| grep '^export EDITOR="vim"'
            cat ~/.zshrc  | grep '^export EDITOR="vim"'

    echoCo  cat ~/.zshrc \| grep '^source ~/.tmuxinator.zsh'
            cat ~/.zshrc  | grep '^source ~/.tmuxinator.zsh'

    echoCo  /bin/zsh -c 'source ~/.zshrc'
            /bin/zsh -c 'source ~/.zshrc'
fi


if [ ! -e ~/.vimrc ]; then
    echoCo  wget "https://raw.githubusercontent.com/FredJiang/.vim/master/.vimrc" -O ~/.vimrc
            wget "https://raw.githubusercontent.com/FredJiang/.vim/master/.vimrc" -O ~/.vimrc
fi


if [ -e ~/.tmux.conf ]; then
    grepResult=$(cat ~/.tmux.conf | grep '^source .*\/powerline\/bindings\/tmux\/powerline\.conf')
    echoCo       cat ~/.tmux.conf | grep '^source .*\/powerline\/bindings\/tmux\/powerline\.conf'
    if [ ${#grepResult} == 0 ]; then
        if which pip > /dev/null; then
            powerline_file=$(pip show powerline-status | awk '/Location:/{print $2 "/powerline/bindings/tmux/powerline.conf"}')
            if [ -e $powerline_file ]; then
                echoCo echo "source  '$powerline_file'"  \>\> ~/.tmux.conf
                       echo "source  '$powerline_file'"  >>   ~/.tmux.conf
            fi
        fi
    fi

    echoCo cat ~/.tmux.conf | grep '^source .*\/powerline\/bindings\/tmux\/powerline\.conf'
           cat ~/.tmux.conf | grep '^source .*\/powerline\/bindings\/tmux\/powerline\.conf'
fi


