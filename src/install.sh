#!/bin/bash

echo "Installinng Benninghoven Environment"

echo changing default logan shell to zsh 👏
[[ "$(which zsh)" == *"not found"* ]] && echo need to install zsh || echo zsh found

chsh -s $(which zsh)


#chsh -s /bin/bash $USER

