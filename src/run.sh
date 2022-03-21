#!/bin/bash

check() {
    # make sure it is zsh on OSX with brew
    echo "checking"
}

imp() {
    echo "[WARNING] this will replace most of your rc files"
    read -p "continue? (Y/n)" DOG
    [[ ! "$DOG" = "Y"]] && exit

    echo "importing started"
    exit

    

    cp .zshrc ~
    echo "copied .zshrc to home dir"
    cp .vimrc ~
    echo "copied .vimrc to home dir"
}

exp() {
    echo "exporting"
}


read -p "import or export environment (i/e)?" INP

if [ $INP = "i" ]; then
    imp
elif [ $INP = "e" ]; then
    exp
else
    echo "you chose death"
    echo "exiting..."
    exit
fi

echo "done"
exit

echo "YEET"
# auto suggest type beat for local sourcing
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

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
