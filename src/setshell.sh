ChangeShellToZsh(){
    # given assuming is already installed
    [[ ! "$SHELL" == *"zsh"* ]] && chsh -s /bin/zsh || echo "😊 login shell already zsh"
}
