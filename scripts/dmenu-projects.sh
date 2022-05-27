#! /bin/bash
#
# ████████╗ |              DMENU-SCRIPTS
# ╚══██╔══╝ |               tachanka61
#    ██║    |
#    ██║    | https://github.com/tachanka61/dmenu-scripts
#    ██║    | Dependencies: dmenu, emacs (default editor)
#    ╚═╝    |

# shellcheck disable=SC1091

# This makes program more secure
# Also you can enable 'x' flag to enable debug
set -euox pipefail

# Load config
if [[ -f "$HOME"/.dmenurc ]]; then
  source "$HOME/.dmenurc"
else
  DMENU() {
    input=$(echo -e "$1" | dmenu -i -l 18)
  }
  DMENU_EDITOR="xterm -e vim"
  DMENU_PROJECT_DIR="$HOME/projects/"
fi

# Get project list
content=$(ls --sort=time "$DMENU_PROJECT_DIR")

DMENU "$content" "Select your project: "

if [[ $input ]]; then
  $DMENU_EDITOR "$DMENU_PROJECT_DIR$input"
fi
