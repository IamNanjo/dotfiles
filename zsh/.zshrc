# Ghostty shell integration
: ${GHOSTTY_RESOURCES_DIR:=/usr/share/ghostty}
if [ -n "$GHOSTTY_RESOURCES_DIR" ] && [ -d "$GHOSTTY_RESOURCES_DIR" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
fi

export ZSH="$HOME/.oh-my-zsh"

# Ensure oh-my-zsh is installed
if ! [ -d "$ZSH/.git" ]; then
	echo "Installing Oh My Zsh"
	rm -rf "$ZSH"
	tmpfile="/tmp/omz-install-$RANDOM.sh"
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o $tmpfile
	sh $tmpfile --unattended --keep-zshrc
	rm $tmpfile
	stow -d ~/.dotfiles -t ~ -S zsh
fi

# Ensure fast-syntax-highlighting is installed
if ! [ -d "$ZSH/custom/plugins/fast-syntax-highlighting" ]; then
	echo "Installing fast syntax highlighting"
	git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH/custom/plugins/fast-syntax-highlighting
fi

ZSH_THEME="simple"

zstyle ":omz:update" mode reminder

unsetopt autocd
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"
HISTSIZE=5000
HISTDUP="erase"

zstyle ":completion:*" matcher-list 'm:{a-z}={A-Za-z}'
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

plugins=(fzf gitfast gh npm bun docker docker-compose golang ssh fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

command -v fast-theme &> /dev/null && fast-theme -q XDG:catppuccin-mocha

if locale -a |grep -i ^en_FI.utf8 &> /dev/null ; then
  export LANGUAGE="en_FI.utf8"
  export LC_ALL="en_FI.utf8"
fi

# Set tab indentation size to 4 spaces if possible
if command -v tabs &>/dev/null; then
    tabs 4
fi

if [ -d /opt/nvim ]; then
	export PATH="/opt/nvim/bin:$PATH"
fi

editors=("nvim" "vim" "pico" "nano")

for editor in "${editors[@]}"; do
	if command -v "$editor" &> /dev/null; then
		export EDITOR=$editor
		export SYSTEMD_EDITOR=$editor
		break
	fi
done

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
elif [ -d $HOME/.dotfiles/.local/bin ]; then
        export PATH=$PATH:$HOME/.dotfiles/.local/bin
fi

if [ -d $HOME/.bun/bin ]; then
	export PATH=$PATH:$HOME/.bun/bin
fi

# zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
    alias cd=z
fi

# mise
if command -v mise &> /dev/null; then
	eval "$(mise activate zsh)"
fi
