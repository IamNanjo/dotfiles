alias c="clear"
alias tree="tree -Fh"

alias ls="ls --color=auto"
alias ll="ls -AlF"
alias la="ls -A"
alias l="ls -CF"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

if command -v batcat &> /dev/null; then
	alias bat="batcat -p"
elif command -v bat &> /dev/null; then
	alias bat="bat -p"
fi

alias ssh="TERM=xterm-256color ssh"
