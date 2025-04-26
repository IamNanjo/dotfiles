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

# Ensure Zig completions are installed
if ! [ -d "$ZSH/custom/plugins/zig-shell-completions" ]; then
	echo "Installing Zig completions"
	git clone https://github.com/ziglang/shell-completions $ZSH/custom/plugins/zig-shell-completions
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

plugins=(fzf gitfast npm docker docker-compose golang zig-shell-completions ssh fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

command -v fast-theme &> /dev/null && fast-theme -q XDG:catppuccin-mocha

if command -v locale &> /dev/null; then
	available_locales=$(locale -a)

	if echo $available_locales | grep -qE "^en_FI\.(utf8|UTF-8)$"; then
		export LANG="en_FI.UTF-8"
		export LC_ALL="en_FI.UTF-8"
	elif echo $available_locales | grep -qE "^en_GB\.(utf8|UTF-8)$"; then
		export LANG="en_GB.UTF-8"
		export LC_ALL="en_GB.UTF-8"
	elif echo $available_locales | grep -qE "^en_US\.(utf8|UTF-8)$"; then
		export LANG="en_US.UTF-8"
		export LC_ALL="en_US.UTF-8"
	fi
fi

# Set tab indentation size to 4 spaces if possible
if command -v tabs &>/dev/null; then
    tabs 4
fi

if [ -d /opt/nvim ]; then
	export PATH="/opt/nvim/bin:$PATH"
fi

editors=("nvim" "vim" "pico")

for editor in "${editors[@]}"; do
	if command -v "$editor" &> /dev/null; then
		export EDITOR=$editor
		export SYSTEMD_EDITOR=$editor
		break
	fi
done

unset editors

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f $HOME/.env ]; then
    source $HOME/.env
fi

if [ -f $HOME/.dotfiles/.bash_aliases ]; then
    source $HOME/.dotfiles/.bash_aliases
elif [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

if [ -f $HOME/.env-path ]; then
	source $HOME/.env-path
fi

# zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
    alias cd=z
fi

# mise
if command -v mise &> /dev/null && [ -x ~/.local/bin/mise ]; then
	eval "$(mise activate zsh)"
fi
