#!/bin/bash

echo "installing dotfiles by weluvsz, yay^^"
echo "---"


echo "copying configs"

cp -r ./config/* "$HOME/.config"

echo "---"
echo "config copying completed"
echo "---"


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
if [ ! -d " $HOME/.local/share/fonts" ]; then
        mkdir "$HOME/.local/share/fonts"
fi

cp ./fonts/* "$HOME/.local/share/fonts"
fc-cache -fv
echo "installed✅"

echo "---"
echo "installing zshrc"
cp .zshrc "$HOME/.zshrc"
echo "done"

echo "---"
echo "installing dotfiles finished"
