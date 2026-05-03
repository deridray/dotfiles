# ====== base settings ======
set -g fish_greeting  ""
set -g theme_display_git no
set -g theme_nerd_fonts yes
fastfetch

# ====== alias ======
alias ls="ls --color=auto"
alias ll="ls -lah"
alias grep="grep --color=auto"
alias update="paru -Syu"
alias ..="cd .."
alias ...="cd ../.."
alias connect="ssh owodray@192.168.0.107"
alias upd="sudo nano /opt/discord/resources/build_info.json"
alias tosu="~/documents/tosu/tosu"
alias vencord='sh -c "$(curl -sS https://vencord.dev/install.sh)"'
alias collector="~/documents/collector/osu-collector-dl"
alias dotfiles="$HOME/dotfiles/.sync.sh"
alias commit="$HOME/dotfiles/.push.sh"
alias whitelist="nano $HOME/dotfiles/.whitelist"
alias fishconfig="nvim ~/.config/fish/config.fish"
alias hyprconfig="nvim ~/.config/hypr/hyprland.conf"
alias f="yazi"
alias vim="nvim"
alias aur="paru"
alias paur="paru"
alias yay="paru"
alias s="paru -S"
alias S="paru -S"
alias ss="paru -Ss"
alias Ss="paru -Ss"
alias sy="paru -Sy"
alias Sy="paru -Sy"
alias syu="paru -Syu"
alias Syu="paru -Syu"
alias syy="paru -Syy"
alias Syy="paru -Syy"
alias r="paru -R"
alias R="paru -R"
alias rs="paru -Rs"
alias Rs="paru -Rs"
alias rns="paru -Rns"
alias Rns="paru -Rns"
alias sc="paru -Sc"
alias Sc="paru -Sc"
alias c="clear && fastfetch"
alias fetch="clear && fastfetch"

alias neofetch="fastfetch"
alias waybar="$HOME/.config/waybar/launch.sh"

# ====== integration with starship ======
if type -q starship
    starship init fish | source
end

# ====== history sync in sessions ======
function save_history --on-event fish_exit
    history save
end

function load_history --on-event fish_prompt
    history merge
end

# ====== autosuggestions and highliting ======
set -g fish_color_command green
set -g fish_color_param cyan
set -g fish_color_autosuggestion brblack
set -g fish_color_error red
set -g fish_color_operator yellow

# ====== git indicator in prompt ======
function fish_prompt
    set_color cyan
    echo -n (prompt_pwd)
    set_color normal
    if test (git rev-parse --is-inside-work-tree ^/dev/null) 2>/dev/null
        set_color yellow
        echo -n "  "(git branch --show-current)
        set_color normal
    end
    echo -n " ❯ "
end
starship init fish | source

# ====== set default editor ======
set -gx EDITOR code

fish_add_path /home/deridray/.spicetify
