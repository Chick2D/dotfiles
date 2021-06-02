# _____    _
#|__  /___| |__  _ __ ___
#  / // __| '_ \| '__/ __|
# / /_\__ \ | | | | | (__
#/____|___/_| |_|_|  \___|

# Better Error
command_not_found_handler () {
    echo "$(tput setaf 1 && tput bold)ERROR:$(tput sgr0 && tput sgr0) Command not found."
}

# Plugins
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/p10k

# Aliases
source $HOME/.config/zsh/alias

