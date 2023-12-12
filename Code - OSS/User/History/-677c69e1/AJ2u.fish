function gtk-settings -d "Set the variables for the GTK env"
    set -f schema org.gnome.desktop.interface
    set -f config $(XDG_CONFIG_HOME:-$HOME/.config)/gtk-3.0/settings.ini
end