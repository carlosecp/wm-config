#!/usr/bin/env bash

install_command="paru -S --needed --noconfirm --quiet"

# dependencies
sudo pacman -S rustup --needed --noconfirm
rustup install stable
rustup default stable

if ! command -v paru > /dev/null; then
	build_dir=`mktemp -d`
	git clone https://aur.archlinux.org/paru.git $build_dir
	cd $build_dir && makepkg -si --noconfirm
fi

# base packages (arch repos)
packages=(
	acpi
	awesome
	flameshot 
	kvantum
	lxappearance
	noto-fonts
	pcmanfm-gtk3
	playerctl 
	spotifywm
	xbindkeys 
	xorg-xbacklight 
)

$install_command ${packages[@]}

# aur pacakges
# format: ["binary"]="package"
declare -A aur_packages
aur_packages=(
	["dragon-drop"]="dragon-drop"
	["nsxiv"]="nsxiv"
	["xclip"]="xclip-git"
)

for package in "${!aur_packages[@]}"; do
	if ! command -v $package > /dev/null; then
		$install_command ${aur_packages[$package]}
	fi
done
