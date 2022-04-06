# DO THEY EXIST
# IF SO MAKE A BACK UP

# COPY THESE BOYS
# ~/.config/nvim/init.nvim
# ~zshrc
# ~.tmux.conf
# ./config/neofetch/config.conf






ImportConfigFiles() {
    # FIXME ADD AUTO BACKUP
    read -p "☢️  use benninghoven configuration files? (y/N) " DOG
    DOG=$(echo "$DOG" | tr '[:upper:]' '[:lower:]')
    [ "$DOG" = "y" ] || return

    echo "😎 importing config files started"
    # FIXME
    [ ! -d $HOME/.config/neofetch ] && mkdir -p $HOME/.config/neofetch

    cp $CONFILES/config.conf $HOME/.config/neofetch/config.conf
    cp $CONFILES/zsh-git-prompt.sh $HOME/.config
    cp $CONFILES/tmux.conf $HOME/.tmux.conf
    cp $CONFILES/vimrc $HOME/.vimrc
    cp $CONFILES/zshrc $HOME/.zshrc
    
    echo "😎 importing config files complete"
}
