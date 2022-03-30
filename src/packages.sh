PARENTDIR=$(cd ../ && pwd)
CONFILES=$PARENTDIR/confiles
DEPENDENTS=$PARENTDIR/dependents

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

