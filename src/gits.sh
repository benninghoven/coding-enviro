InstallGits(){
    [ ! -d $HOME/.config/zsh ] && mkdir -p $HOME/.config/zsh || echo "zsh config directory already exists"
    ZSHFG=$HOME/.config/zsh
    
    # Cool git prompt
    [ ! -f $ZSHFG/zsh-git-prompt.sh ] && cp $CONFILES/zsh-git-prompt.sh $ZSHFG || echo cool zsh prompt already installed
    # Auto Suggest
    [ ! -d $ZSHFG/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions $ZSHFG/zsh-autosuggestions || echo zsh-autosuggestions already installed 🦑
    # Syntax Highlighting (COLORS)
    [ ! -d $ZSHFG/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSHFG/zsh-syntax-highlighting || echo zsh-syntax highlighting already installed

    # check their zshrc if they are sourcing these bad boys
    grep "zsh-git-prompt.sh" $HOME/.zshrc &> /dev/null
    [ $? == 0 ] || echo "source $ZSHFG/zsh-git-prompt.sh" >> $HOME/.zshrc

    grep "zsh-autosuggestions.zsh" $HOME/.zshrc &> /dev/null
    [ $? == 0 ] || echo "source $ZSHFG/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc

    grep "zsh-syntax-highlighting.zsh" $HOME/.zshrc &> /dev/null
    [ $? == 0 ] || { echo "# SYNTAX HIGHLIGHTING MUST BE SOURCED AT BOTTOM OF ZSHRC" >> $HOME/.zshrc; echo "source $ZSHFG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc; }

    # Vim Theme 🧛
    [ ! -d $HOME/.vim/pack/themes/start ] && mkdir -p ~/.vim/pack/themes/start || echo vim themes dir already created ✅
    [ ! -d $HOME/.vim/pack/themes/start/dracula ] && git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula || echo dracula theme already installed 🧛

}
