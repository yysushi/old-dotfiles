#!/bin/zsh -e

here=$(cd "$(dirname "$0")" && pwd -P)

# TODO: get from windows system
APPDATA_PATH="/mnt/c/Users/yysushi/AppData/Roaming"

mkdir -p "$APPDATA_PATH"/alacritty
# ln -Ffs "$here"/alacritty.yml "$APPDATA_PATH"/alacritty/alacritty.yml
cp "$here"/alacritty.yml "$APPDATA_PATH"/alacritty/alacritty.yml

VCXSRV_PATH="/mnt/c/Users/yysushi/scoop/apps/vcxsrv/current"
cp "$here"/config.xlaunch "$VCXSRV_PATH"
STARTUP_PATH="/mnt/c/Users/yysushi/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"
cp "$here"/xlaunch.bat "$STARTUP_PATH"
