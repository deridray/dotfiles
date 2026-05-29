# my dotfiles for hyprland
<img width="1920" height="1080" alt="hyprland-dusk" src="https://github.com/user-attachments/assets/dab2ee6a-2730-4505-b952-d22ce6fc2528" />
<img width="1920" height="1080" alt="hyprland-forest" src="https://github.com/user-attachments/assets/ff473bda-7c85-4478-8c9a-68e6583c5ef4" />


## [video showcase](https://youtu.be/IKBmkHcGWys)



### !NOTE: these configs are made for me personally, so i don't recommend you to install all things that i have
# 1. installation
```
git clone https://github.com/deridray/dotfiles.git
cd dotfiles
chmod +x ./install.sh
./install.sh
```
# 2. manual installation
### packages:
```
# main pkgs
paru -Syu --needed stow librewolf-bin helium-browser-bin kitty thunar yazi neovim sddm hyprland awww waypaper hyprcursor hyprlock hypridle hyprpicker rofi waybar matugen-bin btop mission-center swaync fastfetch nano xarchiver ncdu flatpak mpv rmpc qimgv better-control pavucontrol fish starship nwg-look nwg-displays nwg-clipman

# drivers and libraries
paru -Syu --needed base-devel git cmake ninja wget zenity udiskie bluez blueman pipewire wireplumber pipewire-pulse pipewire-alsa pamixer mpd xdg-desktop-portal xdg-desktop-portal-hyprland xwaylandvideobridge networkmanager btrfs-progs ntfs-3g gvfs gvfs-dnssd cliphist wl-clipboard ffmpeg tar unzip 7zip jq poppler fd ripgrep ripdrag fzf zoxide resvg imagemagick libqalculate aubio libcava evolution-data-server luarocks playerctl openssh

# themes and fonts
paru -Syu --needed tokyonight-gtk-theme-git adw-gtk-theme noto-fonts noto-fonts-emoji ttf-font-awesome nerd-fonts papirus-icon-theme bibata-cursor-theme-bin ttf-rubik-vf ttf-material-symbols-variable-git python-materialyoucolor ttf-roboto inter-font
 
```

```
# optional dependencies
paru -Syu --needed --noconfirm ente-auth-bin visual-studio-code-bin steam heroic-games-launcher-bin portproton proton-cachyos proton-ge-custom-bin umu-launcher gamemode wine wine-mono portproton prismlauncher discord ayugram-desktop-bin thunderbird spotify jdk8-openjdk jdk17-openjdk jdk21-openjdk cava peaclock obs-studio gpu-screen-recorder gpu-screen-recorder-ui bitwarden losslesscut-bin logmein-hamachi haguichi v4l2loopback-dkms nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
```
### install vencord:
```
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
```

### install spicetify:
```
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
```
### install osu!
```
# installation
git clone https://github.com/NelloKudo/osu-winello.git
cd osu-winello
chmod +x ./osu-winello.sh
./osu-winello.sh
```
![osu! optimization link](https://github.com/NelloKudo/osu-winello/wiki/Optimizing:-osu!-performance#window-managers)

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

## extra

### enable gsr-ui service
```
systemctl enable --now --user gpu-screen-recorder-ui
```
### mtab theme
<img width="1910" height="1025" alt="image" src="https://github.com/user-attachments/assets/2f83a8c6-5c47-4482-870f-c2bbc7f6bfef" />

```
MTAB_SAVE_FORMAT_v1.11.1_{"options":{"showOptionsButton":false},"user":{"name":"user"},"title":{"defaultTitle":"new tab","dynamic":{"enabled":true},"effect":"none","typewriter":{"speed":500,"remainCount":1},"faviconType":"custom"},"message":{"enabled":true,"font":{"type":"default","custom":""},"textColor":"#ffffff","textSize":2,"type":"custom","customText":"\\hh:\\mm | \\d$-\\m$-\\yyyy","weather":{"unitsType":"f"}},"wallpaper":{"type":"file-upload","enabled":true,"frequency":"constant","urls":[],"filters":{"brightness":"1","blur":"0px"},"solidColors":["#171717"]},"ui":{"style":"glass","glassColor":"#19191950","blurStrength":"32px","foregroundColor":"#262626","highlightColor":"#ffffff20","cornerStyle":"round","customCSS":"/* input custom css... */"},"animations":{"enabled":true,"bookmarkTiming":"left","initialType":"animate-up-bouncy","searchType":"animate-page-shrink","bookmarkType":"animate-page-up"},"search":{"enabled":true,"engine":"duckduckgo","useCustomEngine":false,"customEngineURL":"","buttons":{"clear":true,"search":true},"recognizeLinks":true,"suggestions":true,"assist":{"date":true,"math":true,"definitions":true,"conversions":true,"passwordGenerator":true},"placeholderText":"search","bookmarkPlaceholderText":"bookmarks","focusedBorderColor":"#0ea5e9","font":{"type":"default","custom":""},"textColor":"#ffffff","placeholderTextColor":"#a1a1aa","searchIconColor":"#2FA5FF","bookmarkIconColor":"#2FA5FF","selectIconColor":"#2FA5FF","linkTextColor":"#0ea5e9"},"hotkeys":{"enabled":true,"activationKey":" ","closePageKey":"x","searchBookmarksKey":"b"},"bookmarks":{"type":"user-defined","showBookmarkNames":true,"numberKeys":true,"enablePagination":true,"maxBookmarkRowsPerPage":2,"lineOrientation":"top","defaultIconColor":"#ffffff","defaultFolderIconType":"ri-folder-fill","userDefinedCols":4,"userDefined":[{"color":"#ffffff","iconType":"ri-youtube-fill","name":"youtube","type":"bookmark","url":"https://youtube.com/"},{"color":"#ffffff","iconType":"si-gmail","name":"mail","type":"bookmark","url":"https://mail.proton.me/"},{"color":"#ffffff","iconType":"ri-gemini-fill","name":"gemini","type":"bookmark","url":"https://gemini.google.com/"},{"color":"#ffffff","iconType":"ri-cloud-fill","name":"nextcloud","type":"bookmark","url":"https://nc.wysi.pp.ua/"},{"color":"#ffffff","iconType":"ri-github-fill","name":"github","type":"bookmark","url":"https://github.com/deridray"},{"color":"#ffffff","iconType":"ri-book-fill","name":"classroom","type":"bookmark","url":"https://classroom.google.com/u/1/?pli=1"},{"color":"#ffffff","iconType":"ri-twitter-fill","name":"twitter","type":"bookmark","url":"https://x.com/"},{"color":"#ffffff","iconType":"ri-circle-fill","name":"osu!","type":"bookmark","url":"https://osu.ppy.sh/users/28285968"}],"defaultBlockyCols":4,"defaultBlockyColorType":"custom","defaultBlockyColor":"#ffffff","bookmarksLocationFirefox":"toolbar","defaultFaviconSource":"duckduckgo"},"extras":{"snow":{"enabled":"off"}}}
```
**[download mtab extension](https://get-mtab.vercel.app/)**


### anti youtube shorts filter for ublock origin
```
https://raw.githubusercontent.com/gijsdev/ublock-hide-yt-shorts/master/list.txt
```

### webhid support
```
echo 'KERNEL=="hidraw*", MODE="0666"' | sudo tee /etc/udev/rules.d/99-webhid.rules
sudo udevadm control --reload-rules && sudo udevadm trigger
```
