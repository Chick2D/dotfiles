#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|

# VI Mode
bindkey -v
export KEYTIMEOUT=1

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Bind ctrl v to open vim
bindkey -s '^v' 'nvim\n'

# Plugins
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/HISTFILE
setopt hist_ignore_all_dups

# Tab completion
autoload -U  compinit
zstyle 'completion:*' menu select
#zmodload zsh/compinit
compinit
_comp_options+=(globdots) # Include hidden files

# AutoCD
setopt autocd
 
#     _    _ _
#    / \  | (_) __ _ ___
#   / _ \ | | |/ _` / __|
#  / ___ \| | | (_| \__ \
# /_/   \_\_|_|\__,_|___/

# Applias
alias v='nvim'
alias c='clear'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias lso='ls --oneline'
alias rm='rm -i'
alias panes='bash ~/Scripts/panes'
alias btm='btm --hide_avg_cpu'
alias r='ranger'
alias mirrorUpdate='sudo reflector --latest 250 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias n='nnn'
alias nf='cat ~/.config/neofetch/neofetchcache'
alias neofetch_small='neofetch --config $HOME/.config/neofetch/smallfetch.conf'
alias neofetch2='neofetch --config $HOME/.config/neofetch/config2.conf' 
alias nfr='neofetch > ~/.config/neofetch/neofetchcache; cat ~/.config/neofetch/neofetchcache'
alias grapefetch='neofetch --config $HOME/.config/neofetch/grapefetch.conf'
source ~/.config/zsh/extract

# QuickCD
alias gtStorage='cd /run/media/chick/Storage && ls'
alias gtWallpapers='cd /run/media/chick/Storage/Wallpapers && ls'
alias gtMovies='cd /run/media/chick/Storage/Movies && ls'
alias gtMemes='cd /run/media/chick/Storage/Memes && ls'
alias gtISOs='cd /run/media/chick/Storage/ISOs && ls'
alias gtGames='cd /run/media/chick/Storage/Games && ls'
alias gtYoutube='cd /run/media/chick/Storage/Youtube && ls'
alias gtPowercord='cd ~/.local/powercord/'
alias gtDmenu='cd ~/Scripts/Dmenu'

# QuickEdit
alias v-bspwmrc='v ~/.config/bspwm/bspwmrc'
alias v-openboxrc='v ~/.config/openbox/rc.xml'
alias v-sxhkdrc='v ~/.config/sxhkd/sxhkdrc'
alias v-alacrittyrc='v ~/.config/alacritty/alacritty.yml'
alias v-polybarc='v ~/.config/polybar/config.ini'
alias v-dunstrc'v ~/.config/dunst/dunstrc'
alias v-picomrc='v ~/.config/picom/picom.conf'
alias v-zshrc='v ~/.zshrc'
alias v-bashrc='v ~/.bashrc'
alias v-i3config='v ~/.config/i3/config'

SAVEIFS=$IFS
IFS="$(printf '\n\t')"
IFS=$SAVEIFS


alias mm='	
cd /run/media/chick/Storage/Games/Minecraft/MultiMC\ \(Linux\)/ &&
./MultiMC & disown && 
cd ~'

pm() {
    sudo pacman "$@"
}

cl() {
	cd $1
	ls


}

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
#eval "$(starship init zsh)"


# Better Error
command_not_found_handler () {
    echo "$(tput setaf 1 && tput bold)ERROR:$(tput sgr0 && tput sgr0) Command not found."
}

# Fetch at startup
afetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
