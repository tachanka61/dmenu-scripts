#! /bin/bash
#
# ████████╗ |              DMENU-SCRIPTS
# ╚══██╔══╝ |               tachanka61
#    ██║    |
#    ██║    | https://github.com/tachanka61/dmenu-scripts
#    ██║    | Dependencies: dmenu, i3lock
#    ╚═╝    |

# Load config
if [ -f "$HOME"/.dmenurc ]; then
  # shellcheck disable=1091
  source "$HOME/.dmenurc"
else
  DMENU() {
    input=$(echo -e "$1" | dmenu -i -l 18)
  }
fi

DMENU "Quit\nLock screen\nPower off\nReboot" "Choose an option:"

echo "$input"

case $input in
  "Quit")
    confirm "Do you really want to reboot your machine?"
    bspc quit # bspwm
    # i3-msg exit # i3
    # Add your own if you want it
    exit 0
    ;;
  "Lock screen")
    confirm "Do you really want to lock your screen?"
    i3lock -c "$DMENU_BG"
    exit 0
    ;;
  "Power off")
    confirm "Do you really want to power off your machine?"
    systemctl poweroff
    exit 0
    ;;
  "Reboot")
    confirm "Do you really want to reboot your machine?"
    systemctl reboot
    exit 0
    ;;
esac

exit 0
