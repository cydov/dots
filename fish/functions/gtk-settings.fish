function gtk-settings -d "Set the variables for the GTK env"
    set -f schema org.gnome.desktop.interface
    set -f config ~/.config/gtk-3.0/settings.ini

    if test ! -e $config
        exit
    end

    set -f theme (grepSettings 'gtk-theme-name' $config)
    set -f icon (grepSettings 'gtk-icon-theme-name' $config)
    set -f cursor (grepSettings 'gtk-cursor-theme-name' $config)
    set -f font (grepSettings 'gtk-font-name' $config)
    
    gsettings set $schema gtk-theme $theme
    gsettings set $schema icon-theme $icon
    gsettings set $schema cursor-theme $cursor
    gsettings set $schema font-name $font
    
    echo (validate $theme $schema gtk-theme)
    echo (validate $icon $schema icon-theme)
    echo (validate $cursor $schema cursor-theme)
    echo (validate $font $schema font-name)
end

function grepSettings
    echo (grep $argv[1] $argv[2] | sed 's/.*\s*=\s*//')
end

function validate

    set -f out (gsettings get $argv[2] $argv[3])
    if test $argv[1] = $out
        echo "$argv[1] is set = $argv[3] $out" 
    else
        echo "$argv[1] is not set = $argv[3] $out"
    end

end
