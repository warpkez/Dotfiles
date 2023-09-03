#!/bin/sh

PKGS="sway swaybg wofi fonts-font-awesome clipman waybar swaylock kitty rofi thunar-font-manager alacritty dolphin"
DIRS="sway waybar swaylock wofi kitty lxterminal nvim scripts"

echo "Installing Sway and other packages" 
sudo apt install -y $PKGS && touch .success

echo "Copying config files"
if [ -e .success ]; then
 for dir in $DIRS; do
    [ -d ~/.config/$dir ] || mkdir ~/.config/$dir
    cp $dir/* ~/.config/$dir
 done
 cd ~/.config/scripts && chmod +x * && cd
 echo "Done"
else
 echo "Installation failed"    
fi

rm .success