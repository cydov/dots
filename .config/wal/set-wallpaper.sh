#!/usr/bin/env sh

#type="wave"
#type="wipe"
type="random" || $1
fps=60
bez=.43,1.19,1,.4
dur=0.7
pos=$(hyprctl cursorpos)
paper=$(cat ~/.cache/wal/wal)

swww img "$paper" \
    --transition-bezier $bez \
    --transition-fps $fps \
    --transition-type $type \
    --transition-duration $dur \
    --transition-pos "$pos" \
