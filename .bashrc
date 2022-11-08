# this file is copyright free (public domain)

# this file is intended for use on a system running Gentoo Linux with `doas` for permissions

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.

if [[ $- != *i* ]] ; then
    return
fi

export PATH="$HOME/.local/bin:$HOME/.local/scripts:$PATH"



# Put fun stuff here.
# add some extra color to everything
source $HOME/.config/shell/colors

# use neovim instead of vim if present
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# tab completion for doas
# -c : Complete arguments as if they were commands
# -f : Complete arguments as if they were directory names (default behaviour)
complete -cf doas

# ---{ aliases / functions }---
# doas/sudo not required for some system commands
for command in dispatch-conf emerge eselect mount poweroff rc-service rc-update reboot shutdown su umount updatedb; do
    alias $command="doas $command"
    # alias $command="sudo $command"
done; unset command

# replacement for `sudoedit` when using `doas` for permissisons
alias doasedit="doas rnano"
alias doedit="doasedit"
alias sudoedit="doasedit"

# quickly elevate last command (same as `doas !!` or `sudo !!`)
bruh() { doas $(fc -ln -1); }
cmon() { doas $(fc -ln -1); }
doit() { doas $(fc -ln -1); }
dude() { doas $(fc -ln -1); }
ffs() { doas $(fc -ln -1); }
pls() { doas $(fc -ln -1); }



# some nice portage aliases and functions

alias depclean="emerge -ac"
alias discon="dispatch-conf"
alias distclean="doas eclean-dist --deep"
alias pkgclean="doas eclean-pkg --deep"

# list all installed packages w/ versions and which repo is used
alias qlist="qlist -IRv"

# list the program that provides the queried command
# i.e. "how vim" to list everything that references "vim"
how() { e-file "$@"; }

# list all packages in the @world set and all available versions (w/ color!)
world() { eix --color -c --world | less -R; }

# rebuild after installing new kernels (rebuild modules)
rebuild-mod() { emerge @module-rebuild; }

# rebuild Go after upgrading to a new version
rebuild-go() { emerge @golang-rebuild; }

# rebuild when using new libraries
rebuild-lib() { emerge @preserved-rebuild; }

1shot() { emerge -av1 "$@"; }
install() { emerge -av "$@"; }
plsinstall() { emerge --ask --autounmask=y --autounmask-write "$@"; }

remove() { emerge -avW "$@"; emerge -ac; }
uninstall() { emerge -avW "$@"; emerge -ac; }
yeet() { emerge -avW "$@"; emerge -ac; }

# AVOID USING UNLESS YOU KNOW WHAT YOU'RE DOING
unmerge() { emerge -aC "$@"; emerge -ac; }

# update *everything*
# 1. sync portage (and run eix post-sync hook, if configured)
# 2. update all packages in the @world set along with their build dependencies
# 3. run `depclean` to remove orphans
# 4. update mlocate database and cache
update() { emerge --sync; emerge -uvDN --complete-graph=y --with-bdeps=y @world; emerge -c; updatedb; }



# git dotfiles alias
alias dot="/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME"



# colors everywhere and added brevity
alias bc="bc -ql"
alias c="clear"
alias cat="bat"
alias chmox="chmod +x"
alias chmow="chmod +w"
alias chmall="chmod 777"
alias cp="cp -iv"
alias diff="diff --color=auto"
alias e="$EDITOR"
alias ed="clear; ed -vp '${NL}( ${MAG}*${RC}._.) ${B}:${RC}'"
# alias emacs="emacsclient -ac 'emacs'"
alias ffmpeg="ffmpeg -hide_banner"
alias g="git"
alias ga="git add"
alias 'ga.'="git add ."
alias 'g.'="git init && git add ."
alias gc="git commit"
alias gcs="git commit -S"
alias gp="git push"
alias grep="grep --color=auto"
alias ip="ip -color=auto"
alias ka="killall"
# alias lf="lfub"
alias ls="ls -hN --color=auto --group-directories-first"
alias la="ls -A"
alias ll="ls -lA"
alias mkd="mkdir -pv"
alias nf="echo; neofetch"
# alias nsx="nsxiv"
alias sx="sxiv"
alias mv="mv -iv"
alias pf="echo; pfetch"
alias po="popd"
alias pu="pushd"
alias rb="reboot"
alias rm="rm -iv"
# alias scim="sc-im"
alias sdn="shutdown -h now"
alias t10="du -ah . | sort -hr | head -n 10"
alias 'tmux-ks'="tmux kill-server"
# alias tre="trash-empty"
# alias trl="trash-list"
# alias trm="trash-rm"
# alias trp="trash-put"
# alias trr="trash-restore"
alias top="glances"
alias v="vim"
alias which="type -a"
alias where="locate"
alias YT="youtube-viewer"
alias yt="yt-dlp --embed-metadata -i"
alias yta="yt -x -f bestaudio/best"
alias z="zathura"

# handy navigation shortcuts
alias '?'="duck"
alias '??'="google"
alias '???'="bing"
alias '..'="cd .."
alias '...'="cd ../.."
alias '....'="cd ../../.."
alias '.....'="cd ../../../.."
alias '......'="cd ../../../../.."
alias 'cd..'="cd .."
alias 'cd-'="cd -"
alias '+'="pu"
alias '_'="po"
alias ':q'="exit"
