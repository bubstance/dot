# this file is copyright free (public domain)

# this file is intended for use on a system running Gentoo Linux with `doas` for permissions

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.

if [[ $- != *i* ]] ; then
    return
fi

export PATH="$HOME/.local/bin:$HOME/.local/scripts:$PATH"

source $HOME/.config/shell/aliases
source $HOME/.config/shell/colors

# ANSI color escapes
GRA=$'\e[1;30m' # gray
RED=$'\e[1;31m' # red
GRN=$'\e[1;32m' # green
YEL=$'\e[1;33m' # yellow
BLU=$'\e[1;34m' # blue
MAG=$'\e[1;35m' # magenta
CYA=$'\e[1;36m' # cyan
WHI=$'\e[1;37m' # white

# ANSI text decorations
B=$'\e[1m' # bold
U=$'\e[4m' # underline
F=$'\e[5m' # flashing/blinking

# reset all text colors and decorations
RC=$'\e[0m'
