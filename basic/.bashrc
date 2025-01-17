case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

shopt -s globstar

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$TERM" = "xterm-kitty" ]; then 
  export TERM=xterm-256color
fi

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\H\[\033[00m\] : \[\033[01;34m\]$PWD\[\033[00m\]\n\$ '

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f $HOME/.env ]; then
    source $HOME/.env
fi

if [ -f ~/.dotfiles/.bash_aliases ]; then
    . ~/.dotfiles/.bash_aliases
elif [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR=$HOME/.nvm
[ -s $NVM_DIR/nvm.sh ] && \. $NVM_DIR/nvm.sh  # This loads nvm
[ -s $NVM_DIR/bash_completion ] && \. $NVM_DIR/bash_completion  # This loads nvm bash_completion

export EDITOR=nvim
export SYSTEMD_EDITOR=nvim

if locale -a |grep -i ^en_FI.utf8 &> /dev/null ; then
  export LANGUAGE="en_FI.utf8"
  export LC_ALL="en_FI.utf8"
fi

if [ -d $HOME/.local/bin ]; then
	export PATH=$PATH:$HOME/.local/bin
fi

if [ -d $HOME/.dotfiles/.local/bin ]; then
	export PATH=$PATH:$HOME/.dotfiles/.local/bin
fi

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi

# yarn
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

# bun
export BUN_INSTALL=$HOME/.bun
export PATH=$BUN_INSTALL/bin:$PATH

# go
export PATH=$PATH:/usr/local/go/bin

. $HOME/.cargo/env

. "$HOME/.cargo/env"

# Zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
    alias cd=z
fi
