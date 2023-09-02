#!/bin/sh

PKGS="sway swaybg wofi fonts-font-awesome clipman waybar swaylock kitty rofi thunar-font-manager alacritty dolphin"
DIRS="sway waybar swaylock wofi kitty lxterminal nvim scripts"
sudo apt install -y $PKGS && touch .success

if [ -e .success ]; then
 for dir in $DIRS; do
    [ -d ~/.config/$dir ] || mkdir ~/.config/$dir
    cp $dir/* ~/.config/$dir
     done
fi