#!/bin/bash

echo -e -n "\e[32m[?]\e[0m Would you like to install my dotfiles? (Yes/No)"
read input1
case $input1 in

"Yes")
installconfig
;;

"yes")
installconfig
;;

"y")
installconfig
;;

"No")
exit
;;

"no")
exit
;;

"n")
exit
;;

*)
    echo "Unknown option, try again."
    ;;
esac

installconfig(){
    mkdir ~/.oldconfig/
    mv ~/.config/ -t ~/.oldconfig/
    git clone https://github.com/chick2d/dotfiles chick-dotfiles
    cd ~/chick-dotfiles
    mv .config/ -t ~

    nvim -c :PlugInstall -c

    echo -e "\e[32m[?]\e[0m Finished "

    question_packages
}

question_packages(){

echo -e -n "\e[32m[?]\e[0m Install my commonly used packages? (Yes/No)"
read input1
case $input1 in

"Yes")
packages
;;

"yes")
packages
;;

"y")
packages
;;

"No")
question_aurhelper
;;

"no")
question_aurhelper
;;

"n")
question_aurhelper
;;

*)
    echo "Unknown option, try again."
    ;;
esac

}

question_aurhelper(){

    echo "
    \e[32m[?]\e[0m Choose a AUR Helper?
    \033[1;31m[\033[m1\033[1;31m] \033[mYay
    \033[1;34m[\033[m2\033[1;34m] \033[mParu
    \033[1;32m[\033[m3\033[1;32m] \033[mAura
    \033[0;37m[\033[m0\033[0;37m] \033[mNone
    "
    read input3
    case $input3 in

    "1")
        echo "yay-bin" >> aurlist
    ;;

    "2")
        echo "paru-bin" >> aurlist
    ;;

    "3")
        echo "aura-bin" >> aurlist
    ;;

    "0")
        aurpackages
    ;;

    *)
        echo "Unknown option, try again."
        ;;
    esac
}

# comeback to add more packages later (note to self)
packages(){
sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm bspwm
sudo pacman -S --noconfirm sxhkd
sudo pacman -S --noconfirm polybar 
sudo pacman -S --noconfirm nitrogen
sudo pacman -S --noconfirm htop
sudo pacman -S --noconfirm bottom
sudo pacman -S --noconfirm exa
sudo pacman -S --noconfirm zsh
sudo pacman -S --noconfirm vlc
sudo pacman -S --noconfirm tldr
sudo pacman -S --noconfirm unzip
sudo pacman -S --noconfirm p7zip
sudo pacman -S --noconfirm zathura
sudo pacman -S --noconfirm keepassxc
sudo pacman -S --noconfirm nemo
sudo pacman -S --noconfirm nnn
sudo pacman -S --noconfirm discord
sudo pacman -S --noconfirm qutebrowser
sudo pacman -S --noconfirm librewolf
sudo pacman -S --noconfirm network-manager-applet
sudo pacman -S --noconfirm youtube-dl
sudo pacman -S --noconfirm obs-studio
sudo pacman -S --noconfirm flameshot
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm imagemagick
sudo pacman -S --noconfirm ttf-fira-code
sudo pacman -S --noconfirm spotify
sudo pacman -S --noconfirm teams
sudo pacman -S --noconfirm qbittorrent
sudo pacman -S --noconfirm gcolor3
}

aurpackages(){
if [[ ! -d /tmp/aur_building ]];then
    printf "\033[1;33mSCRIPT:\033[0m No previous aur_building directory found, proceeding.\n"
else
    rm -rf /tmp/aur_building
    printf "\033[1;33mSCRIPT:\033[0m Removing old aur_building folder.\n"
fi

printf "\033[1;33mSCRIPT:\033[0m Reading package list.\n"
for package in $(cat list | grep -vE "^#.*$")
do
  printf "\033[1;33mSCRIPT:\033[0m Cloning ${package}.\n"
  git clone https://aur.archlinux.org/${package}.git /tmp/aur_building/$package
done

printf "\033[1;33mSCRIPT:\033[0m Building packages.\n"
for dir in $(find /tmp/aur_building -mindepth 1 -maxdepth 1 -type d)
do
  cd $dir
  makepkg -sfci --noconfirm --needed
done

if [[ $(pacman -Qtdq) != "" ]];then
    yes | sudo pacman -Rns $(pacman -Qtdq)
    printf "\u001b[31mPACMAN:\033[0m Orphans found and removed, exiting script.\n"
else 
    printf "\u001b[31mPACMAN:\033[0m No orphans found, exiting script.\n"
fi


# this is how you uncomment a package:
# if ... then;
#    sed -i 's/^#\(.*\)/\1/' list 
#fi
}

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.config/zsh/plugins/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# keeping this for storage

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/sxhkd/sxhkdrc
chmod +x ~/.config/polybar/launch.sh
