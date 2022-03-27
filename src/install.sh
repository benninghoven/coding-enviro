#!/bin/bash

echo "Installinng Benninghoven Environment"

echo changing default logan shell to zsh 👏
command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }

chsh -s $(which zsh)


#chsh -s /bin/bash $USER

