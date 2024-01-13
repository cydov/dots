#!/bin/sh

case $1 in

    "wallS")
        walls
    ;;

    "wallI")
        wallc init
    ;;

    "wallC")
        wallc choose
    ;;

    "wallR")
        wallc
    ;;

    "startbar")
        startbar &
    ;;

    "*")
    ;;

esac