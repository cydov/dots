# Handles wallpaper tasks
function setwall -d "Initialize, choose, or randomly set a wallpaper. Valid options are init = Initialize; choose = a menu of images; anything else will be random."
    if test -e $walls
        set -xU walls ~/wallpaper
    end
    set -f method $argv[1]
    set -f init 'init'
    set -f select 'select'
    switch $method
        case $init
            wal -R
        case $select
            wal -i $walls/(basename -a $walls/* | rofi -dmenu -replace -config ~/.config/rofi/config-wall.rasi)
        case '*'
            wal -i $walls/
    end

end