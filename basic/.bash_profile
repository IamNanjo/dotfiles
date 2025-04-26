export TERM=xterm-256color

ensure_dir_exists() {
    for i in "$@"; do
        [ -d "$i" ] || mkdir -p "$i"
    done
}

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

export HISTFILE="$XDG_STATE_HOME/bash/history"
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=10000

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\H\[\033[00m\] : \[\033[01;34m\]$PWD\[\033[00m\]\n\$ '
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

editors=("nvim" "vim" "pico" "nano")

for editor in "${editors[@]}"; do
    if command -v "$editor" &> /dev/null; then
        export EDITOR=$editor
        export SYSTEMD_EDITOR=$editor
        break
    fi
done

unset editors

if command -v locale &> /dev/null; then
    available_locales=$(locale -a)

    if echo $available_locales | grep -qE "^en_FI\.(utf8|UTF-8)$"; then
        export LANG="en_FI.UTF-8"
        export LC_ALL="en_FI.UTF-8"
        xcomposefile=/usr/share/X11/locale/fi_FI.UTF-8/Compose
        [ -r "$xcomposefile" ] && export XCOMPOSEFILE="$xcomposefile"
        unset -v xcomposefile
    elif echo $available_locales | grep -qE "^en_GB\.(utf8|UTF-8)$"; then
        export LANG="en_GB.UTF-8"
        export LC_ALL="en_GB.UTF-8"
    elif echo $available_locales | grep -qE "^en_US\.(utf8|UTF-8)$"; then
        export LANG="en_US.UTF-8"
        export LC_ALL="en_US.UTF-8"
    fi
fi

# Set tab indentation size to 4 spaces if possible
if command -v tabs &>/dev/null; then
    tabs 4
fi

export GOPATH="$XDG_DATA_HOME/go"
export GOCACHE="$XDG_CACHE_HOME/go/build"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

ensure_dir_exists "$XDG_CONFIG_HOME/bash" "$XDG_CACHE_HOME" \
    "$XDG_DATA_HOME" "$(dirname $HISTFILE)" \
    "$GOPATH" "$GOCACHE" "$GOMODCACHE"

[ -r "$XDG_CONFIG_HOME/bash/bashrc" ] && . "$XDG_CONFIG_HOME/bash/bashrc"
