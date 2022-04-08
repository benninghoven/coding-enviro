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
    read -p "⚠️  install Formulae (Third Party Software) (y/N)" INP
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
InstallAPT(){ # assuming we already have APT
    echo 🐧 installing apt packs
    echo "💪 updating and upgrading"
    sudo apt update -y && sudo apt upgrade
    TEMPY=$(mktemp)
    APTS=$DEPENDENTS/apts
    apt list --installed > $TEMPY
    for PACK in $(cat $APTS)
    do  
	cat $TEMPY | grep -i $PACK &> /dev/null
        [ $? == 0 ] && echo ✅ $PACK || sudo apt install $PACK -y
    done
    sudo apt autoremove -y &>/dev/null
    echo 🐧 finished installing apt packs
}
