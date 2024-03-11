#!/bin/bash
#toggle gnome light/dark theme

# get current theme
current_theme=$(gsettings get org.gnome.desktop.interface color-scheme)

# check if current theme is light or dark
if [ "$current_theme" = "'prefer-dark'" ]; then
	gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
else
	gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi
