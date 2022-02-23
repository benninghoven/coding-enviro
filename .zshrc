#= Utility
alias rf="clear;source ~/.zshrc;source ~/.config/neofetch/config.conf"
alias ll="ls -la --color=auto"
alias ls="ls --color=auto"
alias genkey="ssh-keygen -t rsa -b 4096"
#alias python="python3"
#alias pip="pip3"
alias a='./a.out'
alias run="./run.sh"
alias v="source *venv/bin/activate;echo virtual environment activated"
alias d="deactivate;echo virtual environment deactivated"
alias vz="vim ~/.zshrc"
alias vr="vim ~/.vimrc"
alias tmux="TERM=screen-256color-bce tmux"
alias tkill="tmux kill-server"
alias pip3clean="pip3 uninstall -y -r <(pip3 freeze)"

# SSH
alias dev="ssh devin@benninghoven.zapto.org"
alias kern="ssh benninghoven_0866439@rpi.csci4x.com"
alias kernster="ssh benninghoven@www.csci4x.com"
# local
alias pi2g="ssh pi@192.168.1.2"
alias pi4g="ssh pi@192.168.1.7"
alias pi45="ssh pi@192.168.1.44"

#= Visual
neofetch
source ~/.config/zsh-git-prompt.sh # nice zsh prompt i got for github
# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# auto suggest
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

