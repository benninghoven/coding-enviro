#!/bin/bash

PARENTDIR=$(cd ../ && pwd)
CONFILES=$PARENTDIR/confiles
DEPENDENTS=$PARENTDIR/dependents

#= LINUX
Update(){
    # need sudo privs for these
    sudo apt-get update && sudo apt-get dist-upgrade -y
    sudo apt-get install build-essential curl file git
    sudo apt-get install -y zsh-syntax-highlighting
    # move zsh syntax highlighitng to hide it
    [ -d $HOME/zsh-snytax-highlighting ] && mv $HOME/zsh-syntax-highlighting $HOME/.zsh-syntax-highlighting
    echo "# MUST BE SOURCED AT BOTTOM OF ZSHRC" >> $HOME/.zshrc
    TEMP=""
    [[ "$(uname)" == "Darwin" ]] && $TEMP="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" || $TEMP="$HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    echo "source $TEMP" >> $HOME/.zshrc
    # FIXME source the install in zshrc
    # source file > $HOME/.zshrc
}

InstallAPTPacks(){
    echo installing packages
    [[ $(sudo -l 2>/dev/null) ]] && Update
}

#= MAC OS
InstallBrewPacks(){
    BREWS=$DEPENDENTS/brews
    echo checking Homebrew 🍺
    TEMPY=$(mktemp)
    brew leaves > $TEMPY
    for BREW in $(cat $BREWS)
    do  
        grep $BREW $TEMPY &> /dev/null
        [ $? == 0 ] && echo ✅ $BREW || brew install $BREW
    done
}
InstallBrewCasks(){
    CASKS=$DEPENDENTS/casks
    echo checking Homebrew Formulae 🍻
    brew list --cask > $TEMPY
    for CASK in $(cat $CASKS) # for every cask in file, install to machine if not found
    do
        grep $CASK $TEMPY &> /dev/null
        [ $? == 0 ] && echo ✅ $CASK || brew install --cask $CASK
    done
}

InstallBrew(){
    echo installing brew and packages
    # install brew
    hash brew 2>/dev/null && echo 🍺 Homebrew installed || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # install basic packages
    InstallBrewPacks
    # ask to install formulae
    InstallBrewCasks

}

InstallPackages(){
    [[ "$(uname)" == "Darwin" ]] && InstallBrew || InstallAPTPacks
}

InstallGits(){
    # Auto Suggest
    [ ! -d $HOME/.zsh/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions || echo zsh-autosuggestions already installed 🦑
    echo "#MUST LEAVE THIS AT THE BOTTOM OF ZSHRC!" >> $HOME/.zshrc
    echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc

    # Vim Theme 🧛
    [ ! -d $HOME/.vim/pack/themes/start ] && mkdir -p ~/.vim/pack/themes/start || echo vim themes dir already created ✅
    [ ! -d $HOME/.vim/pack/themes/start/dracula ] && git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula || echo dracula theme already installed 🧛

}

Install(){
    echo "installing needed software"
    InstallPackages
    InstallGits
    echo "finished installing needed software"

}

Install
