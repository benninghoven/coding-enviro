#!/bin/bash

CheckSudo(){
    echo "🔎 checking for privilege"
    [[ $(sudo -l 2>/dev/null) ]] && { true;return; } || { false;return; }
}

# HOW TO USE
#if CheckSudo; then
#        echo you got privilege
#else
#        echo no privilege for u
#fi
