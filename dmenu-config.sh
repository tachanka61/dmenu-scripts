#! /bin/bash
#
# ████████╗ |              DMENU-SCRIPTS
# ╚══██╔══╝ |               tachanka61
#    ██║    |
#    ██║    | https://github.com/tachanka61/dmenu-scripts
#    ██║    | Dependencies: dmenu, emacs(default editor)
#    ╚═╝    |

# This makes program more secure
# Also you can enable 'x' flag to enable debug
set -euo pipefail

# shellcheck disable=SC1091,SC2090

# Load config
if [ -f "$HOME"/.dmenurc ]; then
  source "$HOME/.dmenurc"
else
  DMENU() {
    input=$(echo -e "$1" | dmenu -i -l 18)
  }
fi

# Define array of configuration files
declare -A config_array=(
  [bspwm]="$HOME/.config/bspwm/README.org"
  [doom]="$HOME/.config/doom/config.org"
  [fish]="$HOME/.config/fish/config.fish"
  [kitty]="$HOME/.config/kitty/README.org"
  [polybar]="$HOME/.config/polybar/config.ini"
  [starship]="$HOME/.config/starship.toml"
  [sxhkd]="$HOME/.config/sxhkd/sxhkdrc"
  [README]="$HOME/.config/README.org"
)

# Add \n to every entry to display correctly in dmenu
configs=$(printf '%s\n' "${config_array[@]}")

# Launch dmenu
DMENU "$configs" "Select configuration: "

# If something was selected, open selected option in editor
if [[ $input ]]; then
  $DMENU_EDITOR "$input"
fi

exit 0
