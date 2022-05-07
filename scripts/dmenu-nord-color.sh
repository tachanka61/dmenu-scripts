#! /bin/bash
#
# ████████╗ |              DMENU-SCRIPTS
# ╚══██╔══╝ |               tachanka61
#    ██║    |
#    ██║    | https://github.com/tachanka61/dmenu-scripts
#    ██║    | Dependencies: dmenu, xsel, awk
#    ╚═╝    |

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
fi

# Define list of colors
declare -a nord_colors=(
  "nord0  - #2E3440"
  "nord1  - #3B4252"
  "nord2  - #434C5E"
  "nord3  - #4C566A"
  "nord4  - #D8DEE9"
  "nord5  - #E5E9F0"
  "nord6  - #ECEFF4"
  "nord7  - #8FBCBB"
  "nord8  - #88C0D0"
  "nord9  - #81A1C1"
  "nord10 - #5E81AC"
  "nord11 - #BF616A"
  "nord12 - #D08770"
  "nord13 - #EBCB8B"
  "nord14 - #A3BE8C"
  "nord15 - #B48EAD"
)

# Add '\n' to the end of every entry to make correct dmenu output
color_list=$(printf '%s\n' "${nord_colors[@]}")

# Give user a choice
DMENU "$color_list" "Choose color: "

# Parse user choice and copy it to the buffer
echo "$input" \
  | awk -F ' - ' '{print $2}' \
  | xsel -p ; xsel -o | xsel -b
