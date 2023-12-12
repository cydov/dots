function gtk-settings -d "Set the variables for the GTK env"
    set -f schema org.gnome.desktop.interface
    set -f config ~/.config/gtk-3.0/settings.ini

    if test ! -e $config
        exit
    end

    set -f theme grepSettings 'gtk-theme-name' $config
    set -f icon grepSettings 'gtk-icon-theme-name' $config

end

function grepSettings
    echo (grep $argv[1] $argv[2] | sed 's/.*\s*=\s*//')
end