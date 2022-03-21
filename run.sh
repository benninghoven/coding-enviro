#! /bin/bash

read -p "import or export environment (i/e)?" INP

echo $INP

FLAG=-1


if [ $INP = "i" ]; then
    echo "import selected"
    FLAG=1
elif [ $INP = "e" ]; then
    echo "export selected"
    FLAG=0
else
    echo "you chose death"
    exit
fi

if [ $FLAG -eq 1 ]; then
    echo "importing bobby"
fi

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
