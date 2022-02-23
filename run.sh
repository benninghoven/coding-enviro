#! /bin/bash

source findCurrentOSType.sh # load function from file
findCurrentOSType

OSX="OSX"

if [ $CURRENT_OS != $OSX ]; then
    echo "installing packages with apt"
else
    echo "installing packages with brew"
fi

source dracula-install.sh

cp .vimrc ~/.vimrc
echo "custom .vimrc deployed"

cp .zshrc ~/.zshrc
echo "custom .zshrc deployed"

cp zsh-git-prompt.sh ~/.config/
echo "zsh prompt moved to .config"
