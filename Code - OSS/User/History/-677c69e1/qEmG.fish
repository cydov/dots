function gtk-settings -d "Set the variables for the GTK env"
    set -f schema org.gnome.desktop.interface
    set -f config ~/.config/gtk-3.0/settings.ini

    if test ! -e $config
        exit
    end

    set -f theme $(grep 'gtk-theme-name' $config | sed 's/.*\s*=\s*//')
    set -f icon $(grep 'gtk-icon-theme-name' $config | sed 's/.*\s*=\s*//')

end

function grepSettings
    echo (grep $argv[1] $argv[2] | sed 's/.*\s*=\s*//')
end