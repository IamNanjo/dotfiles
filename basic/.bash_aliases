alias c="clear"
alias tree="tree -Fh"

alias ls="ls --color=auto"
alias ll="ls -AlFh"
alias la="ls -A"
alias l="ls -CF"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

if command -v batcat &> /dev/null; then
	alias bat="batcat"
fi

alias ssh="TERM=xterm-256color ssh"

if command -v tmux &> /dev/null; then
	alias tmux="tmux -f ~/.config/tmux/tmux.conf"
fi
