# setup list in ubuntu env

## convert capslock to control

additionally write below options to "/etc/default/keyboard"

```python
XKBOPTIONS="ctrl:nocaps"
```

## japanese input

<https://hirooka.pro/?p=8373>

## anti virus software

clamtk

## workspace

- enable workspace

```nolang
System Settings -> Appearance -> Behavior -> Enable workspaces
```

- configure to switch workspace by vim-like key

```nolang
System Settings -> Keyboard -> Shortcuts -> Navigation
```

## mouse

```nolang
System Settings -> Mouse & Touchpad -> General -> Double-click
System Settings -> Mouse & Touchpad -> Touchpad -> Pointer speed
System Settings -> Mouse & Touchpad -> Touchpad -> Tap to click
System Settings -> Mouse & Touchpad -> Touchpad -> Natural scrolling
```

```nolang
System Settings -> Keyboard -> Typing -> Repeat keys
```

## notes for other apps

- hipchat
- slack
- clamav, clamtk
- chromium
- chrome
- zoom
- tig
- ls-colors

```nolang
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark > ~/.dircolors
```

## fix bluetooth

- [paired but no connection](https://askubuntu.com/questions/787023/bluetooth-not-working-on-ubuntu-16-04-lts)
