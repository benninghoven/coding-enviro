#!/bin/bash
PARENTDIR=$(cd ../ && pwd)
CONFILES=$PARENTDIR/confiles

check() {
    # make sure it is zsh on OSX with brew
    echo "checking"
}

imp() {
    echo "[WARNING] this will replace most of your rc files"
    #read -p "continue? (Y/n)" DOG

    #DOG=$(echo "$DOG" | tr '[:upper:]' '[:lower:]')
    #[ ! "$DOG" = "y" ] &&  exit

    echo "importing started 🦑"

    mkdir -p $HOME/.config/neofetch
    cp $CONFILES/config.conf $HOME/.config/neofetch
    cp $CONFILES/tmux.conf $HOME/.tmux.conf
    cp $CONFILES/vimrc $HOME/.vimrc
    cp $CONFILES/zshrc $HOME/.zshrc
    
    echo "importing finished ✅"
}

exp() {
    echo "exporting"
    
}

imp

exit


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
