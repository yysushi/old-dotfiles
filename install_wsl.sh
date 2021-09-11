#!/bin/zsh -e

here=$(cd "$(dirname "$0")" && pwd -P)

# TODO: get from windows system
APPDATA_PATH="/mnt/c/Users/hanaugai/AppData/Roaming"

mkdir -p "$APPDATA_PATH"/alacritty
# ln -Ffs "$here"/alacritty.yml "$APPDATA_PATH"/alacritty/alacritty.yml
cp "$here"/alacritty.yml "$APPDATA_PATH"/alacritty/alacritty.yml

VCXSRV_PATH="/mnt/c/Users/hanaugai/scoop/apps/vcxsrv/current"
cp "$here"/config.xlaunch "$VCXSRV_PATH"/config.xlaunch
STARTUP_PATH="/mnt/c/Users/hanaugai/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/"
cp "$here"/xlaunch.lnk "$STARTUP_PATH"/xlaunch.lnk
