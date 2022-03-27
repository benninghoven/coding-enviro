#!/bin/bash

PARENTDIR=$(cd ../ && pwd)
CONFILES=$PARENTDIR/confiles
DEPENDENTS=$PARENTDIR/dependents

BREWS=$DEPENDENTS/brews
CASKS=$DEPENDENTS/casks
#Homebrew on Linux is only supported on Intel processors!
Update(){
    sudo apt-get update && sudo apt-get dist-upgrade -y
    sudo apt-get install build-essential curl file git
}
InstallBrewPacks(){
    echo installing brew and packages
    hash brew 2>/dev/null && echo 🍺 Homebrew installed || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

InstallAPTPacks(){
    echo installing packages
    [[ $(sudo -l 2>/dev/null) ]] && Update
}

InstallPackages(){
    [[ "$(uname)" == "Darwin" ]] && InstallBrewPacks || InstallAPTPacks
}

InstallPackages
exit

#########################
#         BREWS         #
#########################
echo checking Homebrew 🍺
TEMPY=$(mktemp)
brew leaves > $TEMPY

for BREW in $(cat $BREWS)
do  
    grep $BREW $TEMPY &> /dev/null
    [ $? == 0 ] && echo ✅ $BREW || brew install $BREW
done

#########################
#         CASKS         #
#########################

InstallCasks(){
    echo checking Homebrew Formulae 🍻
    brew list --cask > $TEMPY
    for CASK in $(cat $CASKS) # for every cask in file, install to machine if not found
    do
        grep $CASK $TEMPY &> /dev/null
        [ $? == 0 ] && echo ✅ $CASK || brew install --cask $CASK

    done
}

OS=$(uname)
[[ $OS == "Darwin" ]] && InstallCasks || echo linux chad

exit

# FIXME: make this dynamic!
# hard code check each dir where git repo should be

[ ! -d $HOME/.zsh/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions || echo zsh-autosuggestions already installed 🦑
[ ! -d $LOCAL/share/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git || echo zsh syntax highlighting already installed 🍣
[ ! -d $HOME/.vim/pack/themes/start ] && mkdir -p ~/.vim/pack/themes/start || echo vim themes dir already created ✅
[ ! -d $HOME/.vim/pack/themes/start/dracula ] && git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula || echo dracula theme already installed 🧛

# FOR WSL
#test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
#test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
#echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
# will make if doesn't exist
