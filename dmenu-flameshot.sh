#! /bin/bash
#
# ████████╗ |              DMENU-SCRIPTS
# ╚══██╔══╝ |               tachanka61
#    ██║    |
#    ██║    | https://github.com/tachanka61/dmenu-scripts
#    ██║    | Dependencies: dmenu, flameshot
#    ╚═╝    |

# shellcheck disable=SC1091

# This makes program more secure
# Also you can enable 'x' flag to enable debug
set -euo pipefail

# Load config
if [ -f "$HOME"/.dmenurc ]; then
  source "$HOME/.dmenurc"
else
  DMENU() {
    input=$(echo -e "$1" | dmenu -i -l 18)
  }
  DMENU_SCREENSHOT_FOLDER="$HOME/Pictures/screenshots/"
fi

# Give options
DMENU "GUI Mode (save)\nMonitor 1 (save)\nMonitor 2 (save)\nMonitor 3 (save)\nAll monitors (save)\n\
GUI Mode (copy)\nMonitor 1 (copy)\nMonitor 2 (copy)\nMonitor 3 (copy)\nAll monitors (copy)" \
      "Flameshot: "

flameshot_save() {
  flameshot "$1" -p "$DMENU_SCREENSHOT_FOLDER$(date +"%m-%d_%T").png"
}

flameshot_copy() {
  flameshot "$1" -c
}

case $input in
  "GUI Mode (save)")
    flameshot_save gui
  ;;
  "Monitor 1 (save)")
    flameshot_save screen -n 0
  ;;
  "Monitor 2 (save)")
    flameshot_save screen -n 1
  ;;
  "Monitor 3 (save)")
    flameshot_save screen -n 2
  ;;
  "All monitors (save)")
    flameshot_save full
  ;;
   "GUI Mode (copy)")
    flameshot_copy gui
  ;;
  "Monitor 1 (copy)")
    flameshot_copy screen -n 0
  ;;
  "Monitor 2 (copy)")
    flameshot_copy screen -n 1
  ;;
  "Monitor 3 (copy)")
    flameshot_copy screen -n 2
  ;;
  "All monitors (copy)")
    flameshot_copy full
  ;;
  *)
    echo "Incorrect input!"
    exit 1
  ;;
esac

exit 0