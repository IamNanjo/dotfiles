#!/usr/bin/env bash

# Bash specific envs
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

export HISTFILE="$XDG_STATE_HOME/bash/history"
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=10000

envs_dir="${XDG_CONFIG_HOME:-$HOME/.config}/env"
if [ -z "$envs_dir" ] && [ -d "$envs_dir" ]; then
    for f in "$envs_dir"/*; do
        [ -f "$f" ] && source "$f"
    done
fi
unset envs_dir

ensure_dirs_exist=(
    "$XDG_CONFIG_HOME/bash"
    "$XDG_CACHE_HOME"
    "$XDG_DATA_HOME"
    "$(dirname $HISTFILE)"
    "$GOPATH"
    "$GOCACHE"
    "$GOMODCACHE"
)
for i in "${ensure_dirs_exist[@]}"; do
    [ -n "$i" ] && [ ! -d "$i" ] && mkdir -p "$i"
done
unset ensure_dirs_exist

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

# Set tab indentation size to 4 spaces if possible
if command -v tabs &>/dev/null; then
    tabs 4
fi

[ -r "$XDG_CONFIG_HOME/bash/bashrc" ] && . "$XDG_CONFIG_HOME/bash/bashrc"
