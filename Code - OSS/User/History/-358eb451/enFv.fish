# Handles wallpaper tasks
function setwall -d "Initialize, choose, or randomly set a wallpaper. Valid options are init = Initialize; choose = a menu of images; anything else will be random."
    # Singleton setting of the wallpaper directory
    if test -e $walls
        set -xU walls ~/wallpaper
    end
    # Sets the inputted method desired, valid options are:
    # 'init':   to use the wallpaper used last -- for initial launch only)
    # 'choose': to present a ROFI dmenu containing the files in $walls
    # '*':      any other value will randomly select the wallpaper
    set -f method $argv[1]
    set -f init 'init'
    set -f select 'choose'

    switch $method
        case $init
            wal -R
        case $select
            wal -i $walls/(basename -a $walls/* | rofi -dmenu -replace -config ~/.config/rofi/config-wall.rasi)
        case '*'
            wal -i $walls/
    end
    # Kill and relaunch Waybar to use the new colorscheme
    startbar
    # After running Pywall to generate a colorscheme; run SWWW with the results to display the wallpaper.
    showwall
end