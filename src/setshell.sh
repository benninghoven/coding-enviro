ChangeShellToZsh(){
    # given assuming is already installed
    [[ ! "$SHELL" == *"zsh"* ]] && { echo "🤖 chaning shell to zsh"; chsh -s /bin/zsh; } || echo "😊 login shell already zsh"
}
