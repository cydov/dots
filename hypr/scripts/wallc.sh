#! /usr/bin/env sh

wall=~/wallpaper

getWallpaper() {
    case $1 in

    "init")
        wal -Rq
    ;;

    "choose")
        selected=$(basename -a $2/* | rofi -dmenu -replace -config ~/.config/rofi/config-wall.rasi)
        if [ ! "$selected" ]; then
            exit
        else
            echo $selected
            wal -qi "$2/$selected"
        fi
    ;;

    *)
        wal -qi $2/
    ;;

esac
}

initSwww() {
    if ! swww query > /dev/null ; then
        swww init
    fi
}

getWallpaper "$1" $wall

~/.config/waybar/launch.sh &

initSwww

~/.config/hypr/scripts/setWallpaper.sh

dunstify "Wallpaper Updated" "The new wallpaper is: \n$(cat $HOME/.cache/wal/wal)"
