#!/bin/bash

PARENTDIR=$(cd ../ && pwd)
CONFILES=$PARENTDIR/confiles
DEPENDENTS=$PARENTDIR/dependents

# Source files
for file in *; do 
    if [ -f "$file" ]; then 
        [[ "$file" == "install.sh" ]] || {
            source $file; echo 🍝 $file sauced;
        }
    fi 
done

echo "🦑 installing benninghoven coding environment"

# Install packages based on their kernel
if CheckSudo; then    
    [[ $(CheckOS) == "MACOS" ]] && InstallBrew || InstallAPT
else
    echo no sudo privileges skipping package install
fi

ChangeShellToZsh

# INSTALL GIT / DEPENDENT SOURCE CODE FILES

# ASK about rc and config files to local machine (Both)

# Install PACKAGES including important such as ZSH and utilities (Mac/Linux)
#InstallPackages
#ChangeShellToZsh
#ImportConfigFiles
#InstallGits

echo "🦑 installation complete"
