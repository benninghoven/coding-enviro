# DO THEY EXIST
# IF SO MAKE A BACK UP

ImportConfigFiles() {
    # FIXME ADD AUTO BACKUP
    read -p "☢️  use benninghoven configuration files? (y/N) " DOG
    DOG=$(echo "$DOG" | tr '[:upper:]' '[:lower:]')
    [ "$DOG" = "y" ] || return

    echo "😎 importing config files started"
    # FIXME
    # folders should exist already, but you never know
    [ ! -d $HOME/.config/neofetch ] && mkdir -p $HOME/.config/neofetch
    [ ! -d $HOME/.config/nvim] && mkdir -p $HOME/.config/nvim

    cp $CONFILES/config.conf $HOME/.config/neofetch/config.conf
    cp $CONFILES/tmux.conf $HOME/.tmux.conf
    cp $CONFILES/vimrc $HOME/.vimrc
    cp $CONFILES/zshrc $HOME/.zshrc
    cp $CONFILES/init.vim $HOME/.config/nvim/init.vim
    
    echo "😎 importing config files complete"
}
