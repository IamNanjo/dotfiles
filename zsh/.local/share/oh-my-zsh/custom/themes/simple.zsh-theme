PROMPT=$'%{$fg_bold[green]%}%n@%m %{$reset_color%}: %{$fg_bold[blue]%}%d%{$reset_color%} %{$fg_bold[magenta]%}$(git rev-parse --is-inside-work-tree &>/dev/null && echo ) $(git rev-parse --abbrev-ref HEAD 2>/dev/null)%{$reset_color%}\
$(if [[ $EUID -eq 0 ]]; then echo "#"; else echo "$"; fi) '
