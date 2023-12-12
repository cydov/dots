
function setwall - "Initialize, choose, or randomly set a wallpaper"
    set -f method ($argv[0])
    set -f init 'init'
    set -f select 'select'
    switch $method
        case $init
            wal -i ~/wallpaper/
        case $select
            set -f chosen (/usr/bin/ls -l ~/wallpaper/ | rofi -dmenu -replace -config ~/.config/rofi/config-wall.rasi)
            if 
        case '*'
            command ...
    end
end