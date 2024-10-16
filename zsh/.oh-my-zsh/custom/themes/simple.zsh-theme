PROMPT=$'%{$fg_bold[green]%}%n@%m %{$reset_color%}: %{$fg[blue]%}%d%{$reset_color%} $(git_prompt_info)\
$(if [[ $EUID -eq 0 ]]; then echo "#"; else echo "$"; fi) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" "
