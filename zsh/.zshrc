export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"

zstyle ":omz:update" mode reminder  # just remind me to update when it"s time

DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

plugins=(gitfast npm nvm bun command-not-found docker docker-compose golang ssh)

source $ZSH/oh-my-zsh.sh

if locale -a |grep -i ^en_FI.utf8 &> /dev/null ; then
  export LANGUAGE="en_FI.utf8"
  export LC_ALL="en_FI.utf8"
fi

export EDITOR="nvim"
export SYSTEMD_EDITOR="nvim"

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f $HOME/.env ]; then
    source $HOME/.env
fi

if [ -f $HOME/.dotfiles/.bash_aliases ]; then
    source $HOME/.dotfiles/.bash_aliases
elif [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

if [ -d $HOME/.local/bin ]; then
        export PATH=$PATH:$HOME/.local/bin
fi

if [ -d $HOME/.dotfiles/.local/bin ]; then
        export PATH=$PATH:$HOME/.dotfiles/.local/bin
fi

# yarn
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

# Rust / Cargo
export PATH=$HOME/.cargo/bin:$PATH

# bun
export BUN_INSTALL=$HOME/.bun
export PATH=$BUN_INSTALL/bin:$PATH

# go
export PATH=$PATH:/usr/local/go/bin

# zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
    alias cd=z
fi
