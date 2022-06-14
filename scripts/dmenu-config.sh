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
if [[ -f "$HOME"/.dmenurc ]]; then
    source "$HOME/.dmenurc"
else
    DMENU() {
        input=$(echo -e "$1" | dmenu -i -l 18)
    }
    DMENU_EDITOR="xterm -e vim"
fi

# Define array of configuration files
declare -a config_array=(
    "README   - $HOME/.config/README.org"
    "dwm      - $HOME/.dwm/README.org"
    "emacs    - $HOME/.config/doom/config.org"
    "fish     - $HOME/.config/fish/config.fish"
    "kitty    - $HOME/.config/kitty/README.org"
    "leftwm   - $HOME/.config/leftwm/config.toml"
    "starship - $HOME/.config/starship.toml"
)

# Add \n to every entry to display correctly in dmenu
configs=$(printf '%s\n' "${config_array[@]}")

# Launch dmenu
DMENU "$configs" "Select configuration: "

# If something was selected, open selected option in editor
if [[ $input ]]; then
    path_to_config=$(echo "$input" | awk -F ' - ' '{print $2}')
    $DMENU_EDITOR "$path_to_config"
fi

exit 0
