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

export EDITOR=nvim
export SYSTEMD_EDITOR=nvim

if command -v locale &> /dev/null; then
	available_locales=$(locale -a)

	if echo $available_locales | grep -q "^en_FI"; then
		export LANGUAGE="en_FI.UTF-8"
		export LC_ALL="en_FI.UTF-8"
	elif echo $available_locales | grep -q "^en_GB"; then
		export LANGUAGE="en_GB.UTF-8"
		export LC_ALL="en_GB.UTF-8"
	elif echo $available_locales | grep -q "^en_US"; then
		export LANGUAGE="en_US.UTF-8"
		export LC_ALL="en_US.UTF-8"
	fi
fi

# Set tab indentation size to 4 spaces if possible
if command -v tabs &>/dev/null; then
    tabs 4
fi


if [ -d $HOME/.local/bin ]; then
	export PATH=$PATH:$HOME/.local/bin
elif [ -d $HOME/.dotfiles/.local/bin ]; then
	export PATH=$PATH:$HOME/.dotfiles/.local/bin
fi

# Zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
    alias cd=z
fi

# Mise
if command -v mise &> /dev/null; then
	eval "$(~/.local/bin/mise activate bash)"
fi
