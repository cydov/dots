function gtk-settings -d "Set the variables for the GTK env"
    set -f schema org.gnome.desktop.interface
    set -f config ~/.config/gtk-3.0/settings.ini

    if test ! -e $config
        exit
    end

    set -f theme (grepSettings 'gtk-theme-name' $config)
    echo $theme
    set -f icon (grepSettings 'gtk-icon-theme-name' $config)
    echo $icon
    set -f cursor (grepSettings 'gtk-cursor-theme-name' $config)
    echo $cursor
    set -f font (grepSettings 'gtk-font-name' $config)
    echo $font

    gsettings set "$schema" gtk-theme "$theme"
    echo (gsettings get "$schema" gtk-theme)
    gsettings set "$schema" icon-theme "$icon"
    echo (gsettings get "$schema" icon-theme)
    gsettings set "$schema" cursor-theme "$config"
    echo (gsettings get "$schema" cursor-theme)
    gsettings set "$schema" font-name "$config"
    echo (gsettings get "$schema" font-name)

end

function grepSettings
    echo (grep $argv[1] $argv[2] | sed 's/.*\s*=\s*//')
end