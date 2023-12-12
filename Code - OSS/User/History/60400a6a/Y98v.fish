function showwall -d "Using the values of setwall; display the wallpaper. Parameters: wipe, outer, or none"
    set -f type $argv[1]
    set -f bez .43,1.19,1,.4
    set -f fps 60
    set -f duration 0.7
    set -f pos (hyprctl cursorpos)
    set -f wall (cat ~/.cache/wal/wal)

    if test ! "$type" = "wipe" -o "$type" = "outer" 
        set -f type "random"
    end

    echo off
    if test (swww query | string match -i 'error:')
    swww init
    echo on
    sleep 1
    swww img $wall \
        --transition-bezier $bez \
        --transition-fps $fps \
        --transition-type $type \
        --transition-duration $duration \
        --transition-pos $pos
end