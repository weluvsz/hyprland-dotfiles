#!/bin/bash

echo "installing dotfiles by weluvsz, yay^^\n---"


echo "copying configs"

cp -r ./config/* "$HOME/.config"

echo "---\nconfig copying completed\n---"


if [ ! -d "$HOME/wallpaper" ]; then
	echo "creating directory  and copying wallpapers(in $HOME/wallpaper)"
	mkdir -p "$HOME/wallpaper"
	cp -r ./wallpaper/* "$HOME/wallpaper"
else
	echo "copying wallpapers into $HOME/wallpaper"
	cp ./wallpaper/* "$HOME/wallpaper"
fi
echo "---"

echo "installing fonts"

cp ./fonts/* "$HOME/.local/share/fonts"
fc-cache -fv
echo "installed✅"

echo "\n---\ninstalling zshrc"
cp .zshrc "$HOME/.zshrc"
echo "done"

echo "---\ninstalling dotfiles finished"


