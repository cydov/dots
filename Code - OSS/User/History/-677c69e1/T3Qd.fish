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
    
    gsettings set "$schema" gtk-theme "$theme"
    gsettings set "$schema" icon-theme "$icon"
    gsettings set "$schema" cursor-theme "$config"
    gsettings set "$schema" font-name "$config"
    
    if test '$icon' = (gsettings get "$schema" icon-theme)
        echo "$icon icon was set"
    else
        echo "$icon icon was not set"
    end
    if test $cursor = (gsettings get "$schema" cursor-theme)
        echo "$cursor cursor was set"
    else
        echo "$cursor cursor was not set"
    end
    if test $font = (gsettings get "$schema" font-name)
        echo "$font font was set"
    else
        echo "$font font was not set"
    end
end

function grepSettings
    echo (grep $argv[1] $argv[2] | sed 's/.*\s*=\s*//')
end

function validate

    set -f out (gsettings get $argv[2])
    if test $argv[1] = $out
        echo "$argv[1] is set = $out" 
    else
        echo "$argv[1] is not set = $out"
    end

end