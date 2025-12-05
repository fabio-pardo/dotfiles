# COLORS (Gruvbox Dark)
thm_bg="#282828" # background (dark0)
thm_fg="#ebdbb2" # foreground (light1)

thm_black="#1d2021"  # dark background variant (dark0_hard)
thm_gray="#3d3d3d"   # custom gray
thm_black4="#665c54" # subdued fg / accent (fg3/fg4-ish)

# Core gruvbox accents (kept only if you plan to use them later)
thm_red="#fb4934"
thm_green="#b8bb26"
thm_yellow="#fabd2f"
thm_blue="#83a598"
thm_purple="#d3869b" # was thm_pink, renamed to match gruvbox "purple"
thm_orange="#fe8019"

TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
TMUX_POWERLINE_SEPARATOR_THIN="|"

# See Color formatting section below for details on what colors can be used here.
TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-$thm_bg}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-$thm_fg}
TMUX_POWERLINE_SEG_AIR_COLOR=$(air_color)

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

# See `man tmux` for additional formatting options for the status line.
# The `format regular` and `format inverse` functions are provided as conveinences

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_CURRENT" ]; then
  TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
    "#[$(format regular)]"
    "$TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR"
    "#[$(format inverse)]"
    " #I#F "
    "$TMUX_POWERLINE_SEPARATOR_THIN"
    " #W "
    "#[$(format regular)]"
    "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
  )
fi

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_STYLE" ]; then
  TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
    "$(format regular)"
  )
fi

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_FORMAT" ]; then
  TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
    "#[$(format regular)]"
    "  #I#{?window_flags,#F, } "
    "$TMUX_POWERLINE_SEPARATOR_THIN"
    " #W "
  )
fi

# shellcheck disable=SC1143,SC2128
if [ -z "$TMUX_POWERLINE_LEFT_STATUS_SEGMENTS" ]; then
  TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
    "tmux_session_info $thm_black $thm_fg ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}"
    "hostname $thm_gray $thm_fg ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}"
    "mode_indicator $thm_black4 $thm_fg"
  )
fi

# shellcheck disable=SC1143,SC2128
if [ -z "$TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS" ]; then
  TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
    # "kubernetes_context $thm_black4 $thm_fg"
    "now_playing $thm_gray $thm_fg"
    "weather 237 223"
  )
fi
