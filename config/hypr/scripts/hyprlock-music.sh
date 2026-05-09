#!/usr/bin/env bash
# hyprlock-music.sh - Music player integration for Hyprlock
# Displays current track info, album art, and playback controls
# Dependencies: playerctl (required), curl (for remote art), ImageMagick (for cropping)

set -Eeuo pipefail

# ============================================================================
# Configuration
# ============================================================================

# Player priority order (first available will be used)
PREFERRED_PLAYERS="spotify,mpv,vlc,firefox,chromium,brave,chrome"

# Album art cache settings
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/hyprlock-art"
SQUARE_SIZE=1024
mkdir -p "$CACHE_DIR"

# Progress bar appearance
BAR_LENGTH=16
BAR_CHAR="━"
BAR_HANDLE="⦿"
COLOR_PLAYED="ffffff99"
COLOR_REMAINING="ffffff30"

# ============================================================================
# Helper Functions
# ============================================================================

# Check if command exists
have() { command -v "$1" >/dev/null 2>&1; }

# Select the best available player
select_player() {
  if have playerctl && playerctl -p "$PREFERRED_PLAYERS" status >/dev/null 2>&1; then
    echo "$PREFERRED_PLAYERS"
  else
    echo ""
  fi
}

# Get metadata from active player
get_metadata() {
  local key="$1"
  local fmt="{{ $key }}"
  local player
  player="$(select_player)"

  if [[ -n "$player" ]]; then
    playerctl -p "$player" metadata --format "$fmt" 2>/dev/null || true
  else
    playerctl metadata --format "$fmt" 2>/dev/null || true
  fi
}

# Get player status (Playing/Paused/Stopped)
get_status() {
  local player
  player="$(select_player)"

  if [[ -n "$player" ]]; then
    playerctl -p "$player" status 2>/dev/null || true
  else
    playerctl status 2>/dev/null || true
  fi
}

# Truncate string with ellipsis if too long
trim_string() {
  local str="${1:-}"
  local max_len="${2:-30}"
  local str_len=${#str}

  if ((str_len <= max_len)); then
    printf '%s' "$str"
  else
    printf '%s…' "${str:0:max_len}"
  fi
}

# ============================================================================
# Time Conversion Functions
# ============================================================================

# Convert microseconds to mm:ss format
microseconds_to_mmss() {
  local us="$1"

  [[ "$us" =~ ^[0-9]+$ ]] || {
    printf "0:00"
    return
  }

  local seconds=$((us / 1000000))
  printf '%d:%02d' $((seconds / 60)) $((seconds % 60))
}

# Get track length in mm:ss
get_track_length() {
  local us
  us="$(get_metadata 'mpris:length')"

  if [[ -z "$us" || "$us" == "0" ]]; then
    printf '0:00'
  else
    microseconds_to_mmss "$us"
  fi
}

# Get current position in mm:ss
get_current_position() {
  local us
  local player
  player="$(select_player)"

  if [[ -n "$player" ]]; then
    us="$(playerctl -p "$player" position 2>/dev/null | awk '{print int($1 * 1000000)}')" || true
  else
    us="$(playerctl position 2>/dev/null | awk '{print int($1 * 1000000)}')" || true
  fi

  if [[ -z "$us" || "$us" == "0" ]]; then
    printf '0:00'
  else
    microseconds_to_mmss "$us"
  fi
}

# ============================================================================
# Progress Functions
# ============================================================================

# Calculate progress percentage (0-100)
calculate_progress_percent() {
  local pos_us length_us
  local player
  player="$(select_player)"

  if [[ -n "$player" ]]; then
    pos_us="$(playerctl -p "$player" position 2>/dev/null | awk '{print int($1 * 1000000)}')" || true
    length_us="$(playerctl -p "$player" metadata mpris:length 2>/dev/null)" || true
  else
    pos_us="$(playerctl position 2>/dev/null | awk '{print int($1 * 1000000)}')" || true
    length_us="$(playerctl metadata mpris:length 2>/dev/null)" || true
  fi

  if [[ -n "$pos_us" && -n "$length_us" && "$length_us" -gt 0 ]]; then
    local percent=$((pos_us * 100 / length_us))
    printf '%d' "$percent"
  else
    printf '0'
  fi
}

# Generate progress bar with Pango markup
generate_progress_bar() {
  local percent
  percent="$(calculate_progress_percent)"

  local current_status
  current_status="$(get_status)"

  # Return empty bar if nothing is playing
  if [[ -z "$current_status" || "$current_status" == "Stopped" ]]; then
    local empty_bar=""
    for ((i = 0; i < BAR_LENGTH; i++)); do
      empty_bar+="$BAR_CHAR"
    done
    printf '<span foreground="#%s">%s</span>' "$COLOR_REMAINING" "$empty_bar"
    return
  fi

  # Treat 95%+ as 100% to handle players switching tracks early
  [[ $percent -ge 95 ]] && percent=100

  # Calculate filled segments
  local progress=$((percent * BAR_LENGTH / 100))
  [[ $progress -gt $BAR_LENGTH ]] && progress=$BAR_LENGTH
  [[ $progress -lt 0 ]] && progress=0

  # Build bar segments
  local bar_played=""
  local bar_remaining=""

  for ((i = 0; i < progress; i++)); do
    bar_played+="$BAR_CHAR"
  done

  for ((i = progress; i < BAR_LENGTH; i++)); do
    bar_remaining+="$BAR_CHAR"
  done

  # Generate Pango markup based on position
  if [[ $progress -eq $BAR_LENGTH ]]; then
    # Track complete - handle at end
    printf '<span foreground="#%s">%s</span><span foreground="#ffffff99">%s</span>' \
      "$COLOR_PLAYED" "$bar_played" "$BAR_HANDLE"
  elif [[ $progress -eq 0 ]]; then
    # Track just started - handle at beginning
    printf '<span foreground="#ffffff99">%s</span><span foreground="#%s">%s</span>' \
      "$BAR_HANDLE" "$COLOR_REMAINING" "${bar_remaining}"
  else
    # In progress - played + handle + remaining
    printf '<span foreground="#%s">%s</span><span foreground="#ffffff99">%s</span><span foreground="#%s">%s</span>' \
      "$COLOR_PLAYED" "$bar_played" "$BAR_HANDLE" "$COLOR_REMAINING" "$bar_remaining"
  fi
}

# ============================================================================
# Album Art Functions
# ============================================================================

# Download remote URL to cache
download_to_cache() {
  local url="$1"
  local filename
  filename="$(printf '%s' "$url" | sha256sum | awk '{print $1}').img"
  local output="$CACHE_DIR/$filename"

  if [[ ! -s "$output" ]]; then
    have curl && curl -fsSL --max-time 5 "$url" -o "$output" || true
  fi

  printf '%s' "$output"
}

# Create square-cropped album art
create_square_cover() {
  local input="$1"
  local basename
  basename="$(basename "$input")"
  local output="$CACHE_DIR/${basename%.*}_sq_${SQUARE_SIZE}.jpg"

  # Return cached version if it exists and is newer
  if [[ -s "$output" && "$output" -nt "$input" ]]; then
    printf '%s' "$output"
    return
  fi

  # Create square crop with ImageMagick
  if have convert; then
    convert "$input" -auto-orient -gravity center \
      -thumbnail "${SQUARE_SIZE}x${SQUARE_SIZE}^" \
      -extent "${SQUARE_SIZE}x${SQUARE_SIZE}" \
      -quality 90 "$output" && printf '%s' "$output" && return
  fi

  # Fallback to original if ImageMagick unavailable
  printf '%s' "$input"
}

# Get path to square album art
get_album_art_path() {
  local url
  url="$(get_metadata 'mpris:artUrl')"

  [[ -n "$url" ]] || {
    printf ''
    return
  }

  local local_path=""

  case "$url" in
  file://*)
    local_path="${url#file://}"
    ;;
  http://* | https://*)
    local_path="$(download_to_cache "$url")"
    ;;
  *)
    printf ''
    return
    ;;
  esac

  [[ -n "$local_path" && -s "$local_path" ]] || {
    printf ''
    return
  }

  create_square_cover "$local_path"
}

# ============================================================================
# Display Functions
# ============================================================================

# Get player status icon
get_status_icon() {
  case "$(get_status | tr '[:upper:]' '[:lower:]')" in
  playing)
    printf '󰏤'
    ;;
  paused)
    printf '󰐊'
    ;;
  stopped | *)
    printf '󰓛'
    ;;
  esac
}

# Get active player name
get_active_player() {
  local active_player=""
  local player
  player="$(select_player)"

  if [[ -n "$player" ]]; then
    active_player="$(playerctl -p "$player" -l 2>/dev/null | head -n1)"
  else
    active_player="$(playerctl -l 2>/dev/null | head -n1)"
  fi

  printf '%s' "$active_player"
}

# Get formatted player name with icon
get_player_display() {
  local player
  player="$(get_active_player)"

  case "${player,,}" in
  spotify*)
    printf '󰓇  spotify'
    ;;
  firefox*)
    printf '󰈹  firefox'
    ;;
  chromium*)
    printf '󰊯  chromium'
    ;;
  brave*)
    printf '󰞀  brave'
    ;;
  chrome*)
    printf '󰊯  chrome'
    ;;
  mpv*)
    printf '󰕼  mpv'
    ;;
  vlc*)
    printf '󰕼  vlc'
    ;;
  *)
    printf '%s' "${player:-Unknown}"
    ;;
  esac
}

# ============================================================================
# Command-Line Interface
# ============================================================================

case "${1:-}" in
--title)
  title="$(get_metadata 'xesam:title')"
  printf '%s\n' "$(trim_string "${title:-Nothing Playing}" 29)"
  ;;

--artist)
  artist="$(get_metadata 'xesam:artist')"
  printf '%s\n' "$(trim_string "${artist:-}" 26)"
  ;;

--status)
  printf '%s\n' "$(get_status_icon)"
  ;;

--length)
  printf '%s\n' "$(get_track_length)"
  ;;

--position)
  printf '%s\n' "$(get_current_position)"
  ;;

--progress)
  printf '%s\n' "$(calculate_progress_percent)"
  ;;

--progress-bar)
  printf '%s\n' "$(generate_progress_bar)"
  ;;

--art)
  printf '%s\n' "$(get_album_art_path)"
  ;;

--player)
  printf '%s\n' "$(get_player_display)"
  ;;

--help | *)
  cat <<EOF
Usage: $(basename "$0") [OPTION]

Music player information for Hyprlock.

Options:
  --title         Display song title (truncated to 29 chars)
  --artist        Display artist name (truncated to 26 chars)
  --status        Display play/pause/stop icon
  --length        Display total track length (mm:ss)
  --position      Display current position (mm:ss)
  --progress      Display progress percentage (0-100)
  --progress-bar  Display colored progress bar with Pango markup
  --art           Display path to square-cropped album art
  --player        Display player name with icon
  --help          Show this help message

Examples:
  $(basename "$0") --title
  $(basename "$0") --progress-bar

EOF
  exit 0
  ;;
esac
