#!/bin/bash
source ./packages.sh
source ./setshell.sh
source ./config.sh
source ./gits.sh

echo "installinng benninghoven coding environment 🦑"

# Install PACKAGES including important such as ZSH and utilities (Mac/Linux)
# Install git stuff for (Both)
InstallPackages
# Make ZSH Default (Both)
ChangeShellToZsh
# Copy rc and config files to local machine (Both)
ImportConfigFiles
InstallGits

echo "benninghoven coding environment complete 🦑"
