#!/bin/bash

BIN=/usr/local/bin
LOCAL=/usr/local
PARENTDIR=$(cd ../ && pwd)
CONFILES=$PARENTDIR/confiles
DEPENDENTS=$PARENTDIR/dependents

BREWS=$DEPENDENTS/brews
CASKS=$DEPENDENTS/casks

#########################
#         BREWS         #
#########################
echo checking Homebrew 🍺
for LINE in $(cat $BREWS)
do
    [[ $(which $LINE) == "" ]] && brew install "$LINE" || echo $LINE already installed ✅
done

# compare casks in file to local casks installed
# zwift
# adrive

#########################
#         CASKS         #
#########################
# FIXME: Super slow!
echo checking Homebrew Formulae 🍻
LOCAL_CASKS=$(brew casks)
for CASK in $(cat $CASKS) # for every cask in file, install to machine if not found
do
    brew casks > grep $CASK &> /dev/null
    [ $? == 0 ] && echo $CASK arleady installed ✅ || brew install --cask $CASK
    
done

BREW=$(which brew)

[ ! -f $BREW ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo brew already installed 🐡
[ ! -d $HOME/.zsh/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions || echo zsh-autosuggestions already installed 🦑
[ ! -d $LOCAL/share/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git || echo zsh syntax highlighting already installed 🍣

# FOR WSL
#test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
#test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
#echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
# will make if doesn't exist
[ ! -d $HOME/.vim/pack/themes/start ] && mkdir -p ~/.vim/pack/themes/start || echo vim themes dir already created ✅
[ ! -d $HOME/.vim/pack/themes/start/dracula ] && git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula || echo dracula theme already installed 🧛



