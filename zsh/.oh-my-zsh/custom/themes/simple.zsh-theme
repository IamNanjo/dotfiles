PROMPT=$'%{$fg_bold[green]%}%n@%m %{$reset_color%}: %{$fg_bold[blue]%}%d%{$reset_color%} $(git_prompt_info)\
$(if [[ $EUID -eq 0 ]]; then echo "#"; else echo "$"; fi) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}%{$reset_color%} %{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" "

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
