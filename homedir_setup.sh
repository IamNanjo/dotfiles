#!/usr/bin/env bash

create_dirs() {
	[ -z "$1" ] && exit 1

	mkdir -pv \
		"$1"/{.cache,.config,.local} \
		"$1"/.config/{bash,bat,copyq,fastfetch,flameshot,fsh,ghostty,neomutt,zed,zsh} \
		"$1"/.local/{bin,share,state} \
		"$1"/.local/share/{oh-my-zsh,SpeedCrunch,zsh} \
		"$1"/.local/share/SpeedCrunch/color-schemes
}

HOME_DIR="$HOME"
SKEL_DIR="/etc/skel"

create_dirs "$HOME_DIR"

read -p "Do you also want to edit /etc/skel directory? (y/N) " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
	sudo rm -rfv "$SKEL_DIR"/* "$SKEL_DIR"/.*
	sudo bash -c "$(declare -f create_dirs); create_dirs \"$SKEL_DIR\""
fi

unset HOME_DIR SKEL_DIR
