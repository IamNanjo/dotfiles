#!/usr/bin/env zsh

# Ghostty shell integration
: ${GHOSTTY_RESOURCES_DIR:=/usr/share/ghostty}
if [ -n "$GHOSTTY_RESOURCES_DIR" ] && [ -d "$GHOSTTY_RESOURCES_DIR" ]; then
	builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
fi

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

# Ensure autosuggestions are installed
if ! [ -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
	echo "Installing zsh autosuggestions"
	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
fi

# Ensure Zig completions are installed
if ! [ -d "$ZSH/custom/plugins/zig-shell-completions" ]; then
	echo "Installing Zig completions"
	git clone https://github.com/ziglang/shell-completions $ZSH/custom/plugins/zig-shell-completions
fi

zstyle ":omz:update" mode reminder

zstyle ":completion:*" matcher-list 'm:{a-z}={A-Za-z}'
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

plugins=(fzf gitfast npm docker docker-compose golang zig-shell-completions ssh fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

command -v fast-theme &> /dev/null && fast-theme -q XDG:catppuccin-mocha

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

# Set tab indentation size to 4 spaces if possible
if command -v tabs &>/dev/null; then
	tabs 4
fi

# mise
if command -v mise &> /dev/null && [ -x ~/.local/bin/mise ]; then
	eval "$(mise activate zsh)"
fi
