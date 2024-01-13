#! /usr/bin/env bash

walls=~/wallpapers/

case "$1" in
   "init")
      wal -Rq
      ;;
   "choose")
      #selected=
      ;;
   *)
      wal -i $walls
      ;;
esac
