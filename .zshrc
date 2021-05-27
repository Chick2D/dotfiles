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
# Install these yourself in these specific directories for these to work

#source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
#source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source $HOME/.config/zsh/p10k

# Aliases

alias mirrorUpdate='sudo reflector --latest 250 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias pacmanGhost='~/.scripts/pacman.sh'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias rm='rm -i'
alias g='gotop'
alias vim='nvim'
alias v='nvim'
alias mountntfs='bash scripts/Testing/NTFSMounter.bash'
alias fetch='neofetch --config ~/.config/neofetch/config2.conf --ascii_distro arch'
alias sysinfo='cd ~/scripts/RandomCommunityScripts/ && ./sysinfo && cd ~'

pw-install() {
  cd ~/.local/powercord/src/Powercord/plugins
  git clone $1
  cd ~

}

pw-install-theme() {
  cd ~/.local/powercord/src/Powercord/themes
  git clone $1
  cd ~

}

