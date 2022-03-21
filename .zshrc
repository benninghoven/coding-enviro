source ~/.config/zsh-git-prompt.sh
#= Visual
neofetch
#= Utility
alias rf="clear;neofetch"
alias cl="clear"
alias src="source ~/.zshrc;echo zshrc sourced 🦑"
# add the color flag
alias ll="ls -la --color"
alias ls="ls --color"
alias genkey="ssh-keygen -t rsa -b 4096"
alias vv="echo fix me"
#alias python="python3"
#alias pip="pip3"
alias a='./a.out'
alias run="./run.sh"
alias v="source *venv/bin/activate;echo virtual environment activated"
alias d="deactivate;echo virtual environment deactivated"
alias vz="vim ~/.zshrc"
alias vr="vim ~/.vimrc"
alias tmux="TERM=screen-256color-bce tmux" # fixes tmux sessions not having color
alias tkill="tmux kill-server"
alias pip3clean="pip3 uninstall -y -r <(pip3 freeze)"

# SSH
alias alora="ssh devin@benninghoven.zapto.org"
alias kern="ssh benninghoven_0866439@rpi.csci4x.com"
alias kernster="ssh benninghoven@www.csci4x.com"
# local
alias pi2g="ssh pi@192.168.1.2"
alias pi4g="ssh pi@192.168.1.7"
alias pi45="ssh pi@192.168.1.44"

# auto suggest
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
# MUST BE AT THE END OF FILE
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
