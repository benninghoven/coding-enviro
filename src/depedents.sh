#!/bin/bash

BIN=/usr/local/bin
LOCAL=/usr/local

[ ! -d $LOCAL/Homebrew ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo brew already installed 🐡
[ ! -f /bin/zsh ] && brew install zsh || echo zsh already installed 👽
[ ! -f $BIN/git ] && brew install git || echo git already installed 🐟
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
[ ! -f $BIN/neofetch ] && brew install neofetch || echo neofetch already installed 🍎
[ ! -f $BIN/TMUX ] && brew install tmux || echo tmux already installed 💻
[ ! -f $BIN/htop ] && brew install htop || echo htop already installed 😀
