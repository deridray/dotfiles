#!/bin/bash

set -e

echo "checking paru installation..."

if ! command -v paru &> /dev/null
then
    echo "paru not found, installing paru..."
    # install base-devel and git if not installed (required for paru build)
    sudo pacman -S --needed --noconfirm base-devel git

    # clone paru build repo
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm
    cd ..
    rm -rf paru
    echo "paru installed"
else
    echo "paru is already installed"
fi

echo "starting to install shit, hold tight..."

# 0. copy dotfiles to home, if folder dotfiles exists in cwd
if [ -d ./dotfiles ]; then
  echo "copying dotfiles to home folder..."
  # copy all files/folders from dotfiles/home to ~/
  cp -r ./dotfiles/home/. ~/
  # copy contents of dotfiles/.config to ~/.config without replacing whole folder
  mkdir -p ~/.config
  cp -r ./dotfiles/.config/* ~/.config/ 2>/dev/null || true
  echo "dotfiles copied"
else
  echo "dotfiles folder not found in current directory, skipping copy"
fi

# 1. update system and install packages (paru must be installed!)
paru -Syu --needed --noconfirm firefox alacritty thunar bspwm sxhkd hyprland hyprpaper hyprcursor hyprlock hypridle rofi polybar waybar dunst swaync neofetch visual-studio-code-bin vim neovim gamemode steam prismlauncher xarchiver obs-studio mpv qimgv better-control pavucontrol vesktop ayugram-desktop-bin spotify spicetify-cli jdk8-openjdk jdk17-openjdk jdk21-openjdk base-devel git networkmanager btrfs-progs udiskie flameshot htop mc playerctl zsh arandr nwg-look nitrogen cava peaclock bluez blueman pipewire wireplumber pipewire-pulse pipewire-alsa xdg-desktop-portal xdg-desktop-portal-hyprland xwaylandvideobridge nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader kripton-theme-git ttf-font-awesome ttf-jetbrains-mono ttf-jetbrains-mono-nerd nerd-fonts papirus-icon-theme papirus-folders bibata-cursor-theme-bin

echo "packages installed"

# 2. set up keyboard layouts
sudo mkdir -p /etc/X11/xorg.conf.d/
sudo tee /etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null <<EOF
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,ua,ru"
        Option "XkbVariant" ""
        Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
EOF

echo "keyboard layout configured"

# 3. change default shell to fish
echo "changing your default shell to fish"
chsh -s /usr/bin/fish || echo "failed to change shell for user, do it yourself"
sudo chsh -s /usr/bin/fish root || echo "failed to change shell for root, do it yourself"

# 4. add zsh plugins (requires $ZSH and oh-my-zsh)
if [ -d "$ZSH/custom/plugins" ]; then
  cd "$ZSH/custom/plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions || echo "zsh-autosuggestions already exists"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting || echo "zsh-syntax-highlighting already exists"
  echo "zsh plugins installed"
else
  echo "directory $ZSH/custom/plugins not found, skipping plugin installation"
fi

# 5. install osu!
if [ ! -d osu-winello ]; then
  git clone https://github.com/NelloKudo/osu-winello.git
fi
cd osu-winello
chmod +x ./osu-winello.sh
./osu-winello.sh

echo "all done, restart your computer to apply changes"
