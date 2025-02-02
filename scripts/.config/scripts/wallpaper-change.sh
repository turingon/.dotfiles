#!/bin/bash
directory=~/.config/WallPapers/WallPapers
monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`

if [ -d "$directory" ]; then
    random_background=$(ls $directory/*.jpg | shuf -n 1)
    wal -i $random_background
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $random_background
    hyprctl hyprpaper wallpaper "$monitor, $random_background"

fi
