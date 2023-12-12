function setwall - "Initialize, choose, or randomly set a wallpaper"
    if not $walls
        set -xU walls ~/wallpaper
    end
    set -f method ($argv[1])
    set -f init 'init'
    set -f select 'select'
    switch $method
        case $init
            wal -R
        case $select
            wal -i $walls/(basename -a $walls/* | rofi -dmenu -replace -config $XDG_CONFIG_HOME/rofi/config-wall.rasi)
        case '*'
            wal -i $walls/
    end

end