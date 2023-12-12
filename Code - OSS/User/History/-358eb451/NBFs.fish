
function setwall - "Initialize, choose, or randomly set a wallpaper"
    set -f method ($argv[1])
    set -f init 'init'
    set -f select 'select'
    switch $method
        case $init
            wal -R
        case $select
            wal -i ~/wallpaper/(/usr/bin/ls ~/wallpaper/ | rofi -dmenu -replace -config ~/.config/rofi/config-wall.rasi)
        case '*'
            
    end
end