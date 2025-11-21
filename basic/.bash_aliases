alias c="clear"

alias ls="ls --color=auto"

alias grep="grep -E --color=auto"

alias ssh="TERM=xterm-256color ssh"

if command -v eza &> /dev/null; then
	alias ll="eza -laah --classify --git --total-size --hyperlink --sort time"
	alias tree="eza -lah --tree --classify --git --total-size --hyperlink --sort time"
else
	alias ll="ls -AlFh"
	alias tree="tree -Fh"
fi

if command -v batcat &> /dev/null; then
	alias bat="batcat"
fi

if command -v tmux &> /dev/null; then
	alias tmux="tmux -f ~/.config/tmux/tmux.conf"
fi
