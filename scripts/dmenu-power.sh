#! /bin/bash
#
# ████████╗ |              DMENU-SCRIPTS
# ╚══██╔══╝ |               tachanka61
#    ██║    |
#    ██║    | https://github.com/tachanka61/dmenu-scripts
#    ██║    | Dependencies: dmenu, i3lock
#    ╚═╝    |

# shellcheck disable=SC1091

# This makes program more secure
# Also you can enable 'x' flag to enable debug
set -euo pipefail

# Load config
if [[ -f "$HOME"/.dmenurc ]]; then
  source "$HOME/.dmenurc"
else
  DMENU() {
    input=$(echo -e "$1" | dmenu -i -l 18)
  }
  confirm() {
    DMENU "Yes\nNo" "$1"
    if [[ $input != "Yes" ]] ; then
      echo "Interrupted by user"
    fi
  }
fi

# Ask user what does it want to do
DMENU "Quit\nLock screen\nPower off\nReboot" "Choose an option: "

case $input in
  "Quit")
    confirm "Do you really want to reboot your machine?"
    pkill "$XDG_SESSION_DESKTOP"
  ;;
  "Lock screen")
    confirm "Do you really want to lock your screen?"
    i3lock -c "$DMENU_BG"
  ;;
  "Power off")
    confirm "Do you really want to power off your machine?"
    systemctl poweroff
  ;;
  "Reboot")
    confirm "Do you really want to reboot your machine?"
    systemctl reboot
  ;;
  *)
    echo "Incorrect input!"
    exit 1
  ;;
esac

exit 0
