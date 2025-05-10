![setup](https://github.com/user-attachments/assets/eba80210-2c0f-4fb7-9b43-d8bafa8fffd4)
# my configs for linux
make your linux look fire


## list of configs i have:
- `alacritty`
- `bspwm/sxhkd`
- `rofi`
- `polybar`
- `dunst`
- `picom`
- `neofetch`
- `gtk 2/3/4`
- `zsh`

## packages:
```
# download packages
paru -Syu --needed --noconfirm firefox alacritty thunar bspwm sxhkd rofi polybar dunst picom neofetch gtk gtk2 gtk3 gtk4 code xarchiver mpv qimgv better-control discord telegram-desktop spotify java8-openjdk java17-openjdk java21-openjdk base-devel git networkmanager btrfs-progs flameshot htop mc bluez blueman pipewire wireplumber pipewire-pulse pipewire-alsa nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader playerctl zsh arandr lxappearance nitrogen cava kripton-theme-git ttf-jetbrains-mono ttf-jetbrains-mono-nerd papirus-icon-theme papirus-folders bibata-cursor-theme-bin
```
## git
```
# clone themes for rofi
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
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
cd
```
