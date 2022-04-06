#!/bin/bash
CheckOS(){
    [[ "$(uname)" == "Darwin" ]] && echo "MACOS" || echo "LINUX"
}
