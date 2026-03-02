envs_dir="${XDG_CONFIG_HOME:-$HOME/.config}/env"
if [ -n "$envs_dir" ] && [ -d "$envs_dir" ]; then
    for f in "$envs_dir"/*; do
        [ -f "$f" ] && source "$f"
    done
fi
unset envs_dir

# Zsh specific envs
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

ensure_dirs_exist=(
    "$XDG_CONFIG_HOME"
    "$XDG_STATE_HOME"
    "$ZDOTDIR"
    "$ZSH"
    "$ZSH_CACHE_DIR"
    "$GOPATH"
    "$GOCACHE"
    "$GOMODCACHE"
)
for i in "${ensure_dirs_exist[@]}"; do
    [ -n "$i" ] && [ ! -d "$i" ] && mkdir -p "$i"
done
unset ensure_dirs_exist
