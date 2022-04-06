# MAC OS 🍎
InstallBrew(){
    echo 🍺 installing Homebrew
    # install brew
    hash brew 2>/dev/null && echo 🎊 Homebrew already installed ||  { 
        echo installing homebrew for the first time;
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
        # FIXME: Add whatever to the path
    }
    # install basic packages
    InstallBrewPacks
    # ask to install formulae
    read -p "install Formulae (Third Party Software) (y/N)" INP
    INP=$(echo "$INP" | tr '[:upper:]' '[:lower:]')
    [ "$INP" = "y" ] && InstallBrewCasks
    echo 🍺 finished Homebrew installation
}

InstallBrewPacks(){
    TEMPY=$(mktemp)
    BREWS=$DEPENDENTS/brews
    brew leaves > $TEMPY
    for BREW in $(cat $BREWS)
    do  
        grep $BREW $TEMPY &> /dev/null
        [ $? == 0 ] && echo ✅ $BREW || brew install $BREW
    done
}

InstallBrewCasks(){
    TEMPY=$(mktemp)
    CASKS=$DEPENDENTS/casks
    brew list --cask > $TEMPY
    for CASK in $(cat $CASKS) # for every cask in file, install to machine if not found
    do
        grep $CASK $TEMPY &> /dev/null
        [ $? == 0 ] && echo ✅ $CASK || brew install --cask $CASK
    done
}
# LINUX 🐧

InstallAPT(){
    echo installing apt packs

}







#= LINUX
Update(){
    # need sudo privs for these
    sudo apt-get update && sudo apt-get dist-upgrade -y
    sudo apt-get install build-essential curl file git
    # move zsh syntax highlighitng to hide it
    # SYNTAX IS EITHER IN .zsh, zsh-syntax- or usr/local/share if mac
    #[ -d $HOME/zsh-syntax-highlighting ] && mv $HOME/zsh-syntax-highlighting $HOME/.zsh-syntax-highlighting
    #[[ "$(uname)" == "Darwin" ]] && TEMP="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" || TEMP="$HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    #grep "zsh-syntax-highlighting.zsh" $HOME/.zshrc &> /dev/null
    #[ $? == 0 ] || { echo "# SYNTAX HIGHLIGHTING MUST BE SOURCED AT BOTTOM OF ZSHRC" >> $HOME/.zshrc; echo "source $TEMP" >> $HOME/.zshrc; }

    sudo apt autoremove
}

InstallAPTPacks(){
    echo installing packages
    [[ $(sudo -l 2>/dev/null) ]] && Update
}

#= MAC OS



