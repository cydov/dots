#! /usr/bin/env bash

walls=~/wallpapers/

getWallpaper() {
   
   case $1 in

      "init")
         wal -Rq
         ;;

      "choose")
         selected=$(rofi -theme wallpaper-choose.rasi -show filebrowser -filebrowser-directory $walls -filebrowser-command 'basename')
         if [ ! "$selected" ]; then
            exit
         else
            echo $selected
            wal -qi $walls/$selected
         fi
         ;;

      *)
         wal -qi $walls
         ;;

      esac
   }

   initSwww() {
      if ! swww query > /dev/null ; then
         swww init
      fi
   }

   getWallpaper $1

   ~/.config/waybar/launch.sh &

   initSwww

   ~/.config/wal/set-wallpaper.sh

   dunstify "Wallpaper Updated" "The new wallpaper is: \n$(cat $HOME/.cache/wal/wal)"
