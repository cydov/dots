#!/usr/bin/env bash

schema=org.gnome.desktop.interface
config=~/.config/gtk-3.0/settings.ini

if [ ! -f "$config" ]; then
    echo "$config was not found"
    exit
fi

grepSettings() {
    # shellcheck disable=SC2005
    # shellcheck disable=SC2086
    # shellcheck disable=SC2046
    echo $(grep $1 $config | sed 's/.*\s*=\s*//')
}

validate() {
    local out
    out=$(gsettings get "$schema" "$2")

    if [[ $1 == $(echo "$out" | tr -d "\"\'\`") ]]; then
        echo "$1 is set :: $2 $out"
    else
        echo "$1 was not set :: $2 $out"
    fi
}

schemaTheme="gtk-theme"
schemaIcon="icon-theme"
schemaCursor="cursor-theme"
schemaFont="font-name"

theme=$(grepSettings "gtk-theme-name")
icon=$(grepSettings "gtk-icon-theme-name")
cursor=$(grepSettings "gtk-cursor-theme-name")
font=$(grepSettings "gtk-font-name")

gsettings set $schema $schemaTheme "$theme"
gsettings set $schema $schemaIcon "$icon"
gsettings set $schema $schemaCursor "$cursor"
gsettings set $schema $schemaFont "$font"

validate "$theme" $schemaTheme
validate "$icon" $schemaIcon
validate "$cursor" $schemaCursor
validate "$font" $schemaFont