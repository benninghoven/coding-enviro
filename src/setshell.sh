ChangeShellToZsh(){
    echo changing default logan shell to zsh 👏
    command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }
    [[ ! "$SHELL" == *"zsh"* ]] && chsh -s $(which zsh) || echo "defualt shell already zsh 😊"
}
