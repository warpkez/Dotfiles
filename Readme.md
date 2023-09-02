## About

Configuration and installation scripts for Debian 12 (Bookworm).

### Devtools

This script installs the following initial tools I use for development:
> wget curl gpg apt-transport-https git neofetch ca-certificates htop build-essential cmake keepassxc tmux neovim lxterminal

In addition to the above, it also installs the following:
- Visual Studio Code
- .Net 6.0 & .Net 7.0 SDKs
- Azure CLI
- AWS CLI
- Github CLI

I manually install NodeJS using [Node Version manager](https://github.com/nvm-sh/nvm)

### Adding VS Code Extensions

VS Code extensions
```bash
cat code-extensions.txt | xargs -L 1 code --install-extension
```

Errors can be ignored if the extension is already installed, as some extensions are installed as dependencies of others.

### Sway Installation

This script installs the following packages:
> sway swaybg wofi fonts-font-awesome clipman waybar swaylock kitty rofi thunar-font-manager alacritty dolphin

In addition to the above, it also copies the configuration files to ~/.config and the scripts to ~/.config/scripts

### Tailwind CSS for Blazor

A small script to install Tailwind CSS for Blazor WebAssembly projects.

The catch being, .Net 7.0 SDK is required for this to work as it relies upon the Empty Blazor WebAssembly template.