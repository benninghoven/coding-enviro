ImportConfigFiles() {
    PARENTDIR=$(cd ../ && pwd)
    CONFILES=$PARENTDIR/confiles
    echo "[WARNING] this will replace most of your rc files"
    read -p "continue? (Y/n) " DOG
    DOG=$(echo "$DOG" | tr '[:upper:]' '[:lower:]')
    [ ! "$DOG" = "y" ] && exit

    echo "importing config files started 🦑"
    # FIXME
    [ ! -d $HOME/.config/neofetch ] && mkdir -p $HOME/.config/neofetch

    cp $CONFILES/config.conf $HOME/.config/neofetch/config.conf
    cp $CONFILES/zsh-git-prompt.sh $HOME/.config
    cp $CONFILES/tmux.conf $HOME/.tmux.conf
    cp $CONFILES/vimrc $HOME/.vimrc
    cp $CONFILES/zshrc $HOME/.zshrc
    
    echo "importing config files complete 😎"
}