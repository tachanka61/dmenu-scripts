#! /bin/bash
#
# ████████╗ |              DMENU-SCRIPTS
# ╚══██╔══╝ |               tachanka61
#    ██║    |
#    ██║    | https://github.com/tachanka61/dmenu-scripts
#    ██║    | Dependencies: dmenu, flatpak
#    ╚═╝    |

# This makes program more secure
# Also you can enable 'x' flag to enable debug
set -euox pipefail

# shellcheck disable=SC1091

# Load config
if [[ -f "$HOME"/.dmenurc ]]; then
    source "$HOME/.dmenurc"
else
    DMENU() {
        input=$(echo -e "$1" | dmenu -i -l 18)
    }
    DMENU_FLATPAK_FOLDER="/var/lib/flatpak/exports/bin/"
    DMENU_FLATPAK_RUN="/usr/bin/flatpak run --branch=stable --arch=x86_64"
fi

# Get list of flatpaks
flatpaks=$(ls "$DMENU_FLATPAK_FOLDER")

DMENU "$flatpaks" "Run flatpak: "

if [[ $input ]]; then
    $DMENU_FLATPAK_RUN "$input"
fi