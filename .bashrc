# this file is copyright free (public domain)

# this file is intended for use on a system running Gentoo Linux with `doas` for permissions

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.

if [[ $- != *i* ]] ; then
    return
fi

export PATH="$HOME/.local/bin:$HOME/.local/scripts:$PATH"

source $HOME/.config/shell/colors
source $HOME/.config/shell/aliases
