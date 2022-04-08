InstallDependents(){
    echo 🤖 checking for dependent files
    [ -d $HOME/.config ] || mkdir -p $HOME/.config/ && echo "✅ .config directory already exists"

    [ -d $HOME/.config/zsh ] || mkdir -p $HOME/.config/zsh && echo "zsh config directory already exists"

    CONFIG=$HOME/.config
    ZSHFG=$CONFIG/zsh

    [ -d $CONFIG/nvim ] || { echo creating neovim directory; mkdir $CONFIG/nvim; } && echo ✅ neovim directory already created
    
    # Cool git prompt
    [ ! -f $ZSHFG/zsh-git-prompt.sh ] && cp $CONFILES/zsh-git-prompt.sh $ZSHFG || echo cool zsh prompt already installed
    grep "zsh-git-prompt.sh" $HOME/.zshrc &> /dev/null
    [ $? == 0 ] || echo "source $ZSHFG/zsh-git-prompt.sh" >> $HOME/.zshrc

    # Auto Suggest
    [ ! -d $ZSHFG/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions $ZSHFG/zsh-autosuggestions || echo zsh-autosuggestions already installed 🦑
    grep "zsh-autosuggestions.zsh" $HOME/.zshrc &> /dev/null
    [ $? == 0 ] || echo "source $ZSHFG/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc
    # Syntax Highlighting (COLORS)
    [ ! -d $ZSHFG/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSHFG/zsh-syntax-highlighting || echo zsh-syntax highlighting already installed
    grep "zsh-syntax-highlighting.zsh" $HOME/.zshrc &> /dev/null
    [ $? == 0 ] || { echo "# SYNTAX HIGHLIGHTING MUST BE SOURCED AT BOTTOM OF ZSHRC" >> $HOME/.zshrc; echo "source $ZSHFG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc; }

    # Vim-plug for coc and neovim
    [ -d $HOME/.local/share/nvim ] && echo ✅ vim-plug already installed || { sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'; }

    # FIXME CHECK IF WE NEED TO INSTALL NODE
    curl -sL install-node.vercel.app/lts | bash

    echo 🤖 dependent files done
}
