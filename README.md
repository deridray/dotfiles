![setup](https://github.com/user-attachments/assets/eba80210-2c0f-4fb7-9b43-d8bafa8fffd4)
# my configs for linux
make your linux look fire

## packages:
```
# download packages
paru -Syu --needed --noconfirm firefox alacritty thunar bspwm sxhkd hyprland hyprpaper hyprcursor hyprlock rofi wofi polybar waybar dunst swaync neofetch visual-studio-code-bin gamemode steam prismlauncher xarchiver obs-studio mpv qimgv better-control pavucontrol vesktop ayugram-desktop-bin spotify jdk8-openjdk jdk17-openjdk jdk21-openjdk base-devel git networkmanager btrfs-progs flameshot htop mc playerctl zsh arandr nwg-look nitrogen cava bluez blueman pipewire wireplumber pipewire-pulse pipewire-alsa nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader kripton-theme-git ttf-font-awesome ttf-jetbrains-mono ttf-jetbrains-mono-nerd papirus-icon-theme papirus-folders bibata-cursor-theme-bin
```
## git
```
# clone themes for rofi
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
```
```
# install osu!
git clone https://github.com/NelloKudo/osu-winello.git
cd osu-winello
chmod +x ./osu-winello.sh
./osu-winello.sh
```
### .xinitrc
```
#!/bin/sh

xsetroot -cursor_name left_ptr
export XCURSOR_THEME="Bibata-Modern-Ice"
export XCURSOR_SIZE=24

xrdb -merge ~/.Xresources

xset s off
xset -dpms
xset s noblank

exec sxhkd &
exec bspwm
```
### make zsh your default shell
```
chsh -s $(which zsh)
```
