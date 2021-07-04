#!/bin/zsh -e

here=$(cd "$(dirname "$0")" && pwd -P)

# TODO: get from windows system
APPDATA_PATH="/mnt/c/Users/koketani/AppData/Roaming"

mkdir -p "$APPDATA_PATH"/alacritty
# ln -Ffs "$here"/alacritty.yml "$APPDATA_PATH"/alacritty/alacritty.yml
cp "$here"/alacritty.yml "$APPDATA_PATH"/alacritty/alacritty.yml
