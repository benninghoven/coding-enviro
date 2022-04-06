ChangeShellToZsh(){
    # given assuming is already installed
    [[ ! "$SHELL" == *"zsh"* ]] && chsh -s $(which zsh) || echo "😊 login shell already zsh"
}
