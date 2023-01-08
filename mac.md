# setup list in mac env

## capslock

```nolang
Keyboard -> Keyboard -> Modifier Keys

Control for Caps Lock
```

## workspace

- configure to switch workspace by vim-like key

```nolang
Keyboard -> Shortcuts -> Mission Control -> Move left a space

^⌥L
```

## input source switch

```nolang
Keyboard -> Sources -> Input Sources

check
- Select the previous input source
- Select next source in input menu
```

## speed

```nolang
Keyboard -> Keyboard -> Key Repeat
Keyboard -> Keyboard -> Delay Until Repeat
```
## nix

- nix
- [nix-darwin](https://github.com/LnL7/nix-darwin#install)
- [nix-darwin](https://nix-community.github.io/home-manager/index.html#sec-install-nix-darwin-module)

/run/current-system/sw/bin/darwin-rebuild switch -I darwin-config="$HOME"/.config/nixpkgs/darwin/configuration.nix
