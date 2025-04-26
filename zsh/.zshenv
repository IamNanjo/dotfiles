export TERM=xterm-256color

ensure_dir_exists() {
    for i in "$@"; do
        [ -d "$i" ] || mkdir -p "$i"
    done
}

# ZSH
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export LESSHISTFILE=-

export ZSH_THEME="simple"
export DISABLE_AUTO_TITLE="true"
export COMPLETION_WAITING_DOTS="true"
export DISABLE_UNTRACKED_FILES_DIRTY="true"
export HIST_STAMPS="dd.mm.yyyy"
export HISTDUP="erase"
export HISTSIZE=10000

unsetopt autocd
setopt appendhistory
setopt sharehistory
setopt extended_history
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

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

if [ -d /opt/nvim ]; then
    export PATH="/opt/nvim/bin:$PATH"
fi

editors=("nvim" "vim" "pico")

for editor in "${editors[@]}"; do
    if command -v "$editor" &> /dev/null; then
        export EDITOR=$editor
        export SYSTEMD_EDITOR=$editor
        break
    fi
done

unset editors

export GOPATH="$XDG_DATA_HOME/go"
export GOCACHE="$XDG_CACHE_HOME/go/build"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

ensure_dir_exists "$XDG_CONFIG_HOME" "$XDG_STATE_HOME" \
    "$ZDOTDIR" "$ZSH" "$ZSH_CACHE_DIR" \
    "$GOPATH" "$GOCACHE" "$GOMODCACHE"
