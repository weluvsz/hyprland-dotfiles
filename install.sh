#!/bin/bash

echo "installing dotfiles by weluvsz, yay^^"
echo "checked on arch and fedora"
echo "---"


if [ -f /etc/os-release ]; then
  . /etc/os-release
  DISTRO=$ID
  DISTRO_LIKE=$ID_LIKE
  echo "$DISTRO, i like it<3"
fi


packages(){
	case "$DISTRO" in
	arch|cachyos|manjaro|endeavouros|garuda)

		sudo pacman -S hyprland wofi swww kitty waybar ttf-jetbrains-mono-nerd 

		echo "AUR-helper check:)"

		if which yay >/dev/null 2>&1; then
			echo "using yay"
			AUR="yay"
		elif which paru >/dev/null 2>&1; then
			echo "using paru"
			AUR="paru"
		else 
			echo "cant find aur helper"
			AUR="0"
		fi

		if [ "$AUR" != "0" ];then
			$AUR -S waypaper wofi-emoji hellwal
		else
			pacman -S python-pipx
			pipx install waypaper
			git clone https://github.com/danihek/hellwal && cd hellwal && make
			cd ..
		fi
	;;
	fedora)
		sudo dnf copr enable maveonair/jetbrains-mono-nerd-fonts
		sudo dnf install jetbrains-mono-nerd-fonts kitty pipx waybar hyprland wofi --skip-unavailable 
		pipx install waypaper
		git clone https://github.com/danihek/hellwal  && cd hellwal && make
		cd ..
	;;
esac 
}
echo "installing packages:3"

packages

sleep 1;
echo "---"

echo "copying configs"


cp -r ./config/* "$HOME/.config"


echo "---"
echo "config copying completed"
echo "---"

sleep 1;

if [ ! -d "$HOME/.wallpaper" ]; then
        echo "creating directory  and copying wallpapers(in $HOME/.wallpaper)"
        mkdir -p "$HOME/.wallpaper"
        cp -r ./wallpaper/* "$HOME/.wallpaper"
else
        echo "copying wallpapers into $HOME/.wallpaper"
        cp ./wallpaper/* "$HOME/.wallpaper"
fi

sleep 1

echo "---"

echo "installing fonts"
if [ ! -d "$HOME/.local/share/fonts" ]; then
	mkdir -p "$HOME/.local/share/fonts"
fi 

cp ./fonts/* "$HOME/.local/share/fonts"
fc-cache -fv
echo "installed✅"

sleep 1;

echo "---"
echo "installing zshrc"

cp .zshrc "$HOME/.zshrc"
echo "done"

echo "---"
echo "installing dotfiles finished"


