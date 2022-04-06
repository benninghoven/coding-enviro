#!/bin/bash

CheckSudo(){
    [[ $(sudo -l 2>/dev/null) ]] && return true || return false
}

[[ CheckSudo ]] && echo you have priv || echo you have no priv

