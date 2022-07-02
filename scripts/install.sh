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
	dragon-drop
	maim
	kvantum
	lxappearance
	noto-fonts
	nsxiv
	pcmanfm-gtk3
	playerctl 
	spotifywm
	xbindkeys 
	xclip-git
	xorg-xbacklight 
)

$install_command ${packages[@]}
