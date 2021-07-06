# setup list in windows env

## wsl

<https://docs.microsoft.com/ja-jp/windows/wsl/install-win10#manual-installation-steps>

1. enable windows subsystem for linux

```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

2. check requirements `winver` in `Run`

3. enable virtual machine

```
dism.exe /onine /enable-feature /featurename:VirtualMachinePlatform /all /norestartl
```

4. download linux kernel upgrade package

5. set wsl2 as default version

```
wsl --set-default-version 2
```

6. select linux distribution

## docker

<https://docs.docker.com/docker-for-windows/wsl/>

<https://docs.microsoft.com/ja-jp/windows/wsl/tutorials/wsl-containers>

## font for other terminals

windows terminal font is enough for me.

<https://github.com/edihbrandon/RictyDiminished>

1. install fonts
2. copy and paste in `Control Panel\Appearance and Personalization\Fonts`
3. select font with terminal properties

## ime

1. install google ime
2. remove default ime
3. `alt + \`
4. (option) customize keymap style
  1. remove entries with key `Ctrl Space`
  2. change entries key with `Zenkaku/Hankaku` to `Ctrl Space`

<https://www.cg-method.com/google-ime/#index_id2>

## scoop

- install scoop: <https://github.com/lukesampson/scoop#installation>
- install apps

```
scoop install alacritty
scoop install git
scoop install alacritty
scoop install vcredist2017
scoop install docker

```

<https://qiita.com/nimzo6689/items/1ab33380366e324c0b84>

## clipboard integration

neovim can integrate with windows clipboard via x11. it works as x client. we need run x server in advance.

- overview: <https://github.com/Microsoft/WSL/issues/892>
- neovim requires xsel: <https://github.com/neovim/neovim/commit/037ffd54dcd8edba6787d93273e6696b7a366ac6#diff-b8571b36b7a192b0ee51c989a040ab85590ab220f047287a4fc2155e78edf0d1R106-R111>
- neovim spec can be checked `:help x11-selection` or `:help clipboard`

x server setup is here.

```
C:\Users\koketani\scoop\apps\vcxsrv\current\xlaunch.exe -run 'C:\Users\koketani\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\config.xlaunch'
```

## Powershell tips

`Set-PSReadLineOption -EditMode Vi`

## wallpaper

<https://wallpaperscraft.com/catalog/nature/2560x1080>
