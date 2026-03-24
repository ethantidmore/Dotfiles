#!/bin/bash

# My Arch setup script (base-devel is needed for this)

# Create used directories
mkdir -p /home/"$USER"/Screenshots /home/"$USER"/.config/{bspwm,gtk-3.0,nvim,polybar,ranger,sxhkd} \
	/home/"$USER"/.local/{bin,wallpapers} 

# Install yay
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si
cd ..

# Install useful software
yay -S  aerc arp-scan aws-vault bind bitwarden breeze-cursors bspwm dmenu dosfsntools eza feh firejail gdb go gvim  \
	hashcat ltrace lxappearance macchanger maim man-pages mpv nano neovide neovim nmap noto-fonts noto-fonts-cjk \
	noto-fonts-emoji noto-fonts-extra perl-authen-sasl perl-io-socket-ssl picom polybar pulsemixer python-pipx \
	ranger shellcheck strace sxhkd tcpdump tor torbrowser-launcher tree-sitter-cli ttf-hack-nerd ueberzugpp \
	unclutter unzip valgrind vlc wget wireshark-qt xclip xorg xorg-xinit yt-dlp zip zsh zsh-syntax-highlighting

# Download software from aur
yay -S brave-bin gruvbox-dark-gtk htop-vim prismlauncher webcord

# Install dotfiles
cp .fehbg /home/"$USER"
cp .vimrc /home/"$USER"
cp .xinitrc /home/"$USER"
cp .zshrc /home/"$USER"
cp bspwmrc /home/"$USER"/.config/bspwm
cp config.ini /home/"$USER"/.config/polybar
cp init.lua /home/"$USER"/.config/nvim/
cp city.jpg /home/"$USER"/.local/wallpapers
cp picom.conf /home/"$USER"/.config 
cp rc.conf /home/"$USER"/.config/ranger
cp settings.ini /home/"$USER"/.config/gtk-3.0
cp sxhkdrc /home/"$USER"/.config/sxhkd 

# Scripts
cp scripts/* /home/"$USER"/.local/bin

# Download and install zsh-colored-man-pages
cd zsh-colored-man-pages || exit
makepkg -si
cd ..

# Enable pulsewire
systemctl --user enable pipewire
systemctl --user start pipewire

# Lastly setup my st and dmenu build
cd st-0.8.4 || exit
make
sudo make install
cd ..

cd dmenu-5.2 || exit
make 
sudo make install
