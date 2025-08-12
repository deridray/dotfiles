# my configs for linux(for bspwm and hyprland)
![hyprland](https://github.com/user-attachments/assets/8488fba1-39fe-4bb9-89e9-2beae765c6e9)

## packages:
```
# download packages
paru -Syu --needed --noconfirm firefox alacritty thunar bspwm sxhkd hyprland hyprpaper hyprcursor hyprlock hypridle rofi polybar waybar dunst swaync neofetch visual-studio-code-bin vim neovim gamemode steam prismlauncher xarchiver obs-studio mpv qimgv better-control pavucontrol vesktop ayugram-desktop-bin spotify spicetify-cli jdk8-openjdk jdk17-openjdk jdk21-openjdk base-devel git networkmanager btrfs-progs udiskie flameshot htop mc playerctl zsh arandr nwg-look nitrogen cava peaclock bluez blueman pipewire wireplumber pipewire-pulse pipewire-alsa xdg-desktop-portal xdg-desktop-portal-hyprland xwaylandvideobridge nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader kripton-theme-git ttf-font-awesome ttf-jetbrains-mono ttf-jetbrains-mono-nerd nerd-fonts papirus-icon-theme papirus-folders bibata-cursor-theme-bin
```
## osu!
```
# installation
git clone https://github.com/NelloKudo/osu-winello.git
cd osu-winello
chmod +x ./osu-winello.sh
./osu-winello.sh
```
![osu! optimization link](https://github.com/NelloKudo/osu-winello/wiki/Optimizing:-osu!-performance#window-managers)
### .xinitrc
```
#!/bin/sh

# set cursor theme
xsetroot -cursor_name left_ptr
export XCURSOR_THEME="Bibata-Modern-Ice"
export XCURSOR_SIZE=24

# load Xresources
xrdb -merge ~/.Xresources

# disable screen blanking and DPMS
xset s off
xset -dpms
xset s noblank

# keyboard layouts
setxkbmap -layout us,ua,ru -option 'grp:alt_shift_toggle' &

# monitor refresh rate
xrandr --output DP-2 --mode 1920x1080 --rate 144 &

# sxhkd and bspwm
sxhkd &
exec bspwm
```
### make fish your default shell
```
chsh -s /usr/bin/fish
sudo chsh -s /usr/bin/fish root
```
or
### make zsh your default shell
```
chsh -s $(which zsh)
sudo chsh -s /usr/bin/zsh root
```
then, add plugins
```
cd $ZSH/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
```
