function showwall -d "Using the values of setwall; display the wallpaper. Parameters: wipe, outer, or none"
    set -f type $argv[1]
    set -f bez [.43,1.19,1,.4]
    set -f fps 60
    set -f duration 0.7
    set -f pos (hyprctl cursorpos)

end