#!/usr/bin/env -S bash -x

install_command="paru -S --needed --noconfirm --noredownload"

if ! command -v paru > /dev/null; then
	sudo pacman -S rustup --needed --noconfirm
	rustup install stable
	rustup default stable

	build_dir=`mktemp -d`
	git clone https://aur.archlinux.org/paru.git $build_dir
	cd $build_dir && makepkg -si --noconfirm
fi

packages=(
	acpi
	awesome
	cantarell-fonts
	dragon-drop
	kvantum
	lxappearance
	maim
	noto-fonts
	noto-fonts-emoji
	nsxiv
	pamixer
	pcmanfm-gtk3
	picom
	playerctl 
	rofi
	xbindkeys 
	xclip-git
	xorg
	xorg-xbacklight 
	xorg-xinit
)

$install_command ${packages[@]}
