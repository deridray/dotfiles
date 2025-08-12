# ====== base settings ======
set -g fish_greeting  ""
set -g theme_display_git no
set -g theme_nerd_fonts yes
neofetch

# ====== alias ======
alias ls="ls --color=auto"
alias ll="ls -lah"
alias grep="grep --color=auto"
alias update="paru -Syu"
alias ..="cd .."
alias ...="cd ../.."

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