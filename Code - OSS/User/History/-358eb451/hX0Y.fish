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
            wal -i /(/usr/bin/ls ~/wallpaper/ | rofi -dmenu -replace -config ~/.config/rofi/config-wall.rasi)
        case '*'
            wal -i
    end
end