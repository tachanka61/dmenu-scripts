#! /bin/bash
#
# ████████╗ |              DMENU-SCRIPTS
# ╚══██╔══╝ |               tachanka61
#    ██║    |
#    ██║    | https://github.com/tachanka61/dmenu-scripts
#    ██║    | Dependencies: dmenu, keepassxc-cli, xsel,
#    ╚═╝    | notify-send (libnotify)
# Based on https://github.com/uriel1998/multiple_scripts/blob/master/kpf.sh

# Load config
if [ -f "$HOME"/.dmenurc ]; then
# shellcheck disable=1091
  source "$HOME/.dmenurc"
else
  DMENU() {
    input=$(echo -e "$1" | dmenu -i -l 18)
  }
fi

# Get database location (should be given as argument)
database="$1"

# Ask user password
DMENU_PASS "Enter the password: "

# Save our password to separate variable
password=$input

# Get list of entries
keepass_list=$(echo "$password" \
                | keepassxc-cli ls -R "$database"
              )

# Select an entry
DMENU "$keepass_list" "Choose an entry: "

# shellcheck disable=2086
# Get password and copy it to buffer
echo "$password" \
 | keepassxc-cli show -s "${database}" "$input" \
                      -a password 2> /dev/null \
 | xsel -p ; xsel -o | xsel -b

# Get username and show it using 'notify-send'
notify-send "Username: $(echo $password \
                          | keepassxc-cli show -s $database $input \
                                               -a username
                        )"

exit 0