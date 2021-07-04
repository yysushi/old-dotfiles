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

```
PS C:\Users\koketani> scoop list

Installed apps:



  7zip 19.00 [main]

  alacritty 0.8.0 [extras]

  git 2.32.0.windows.1 [main]

  innounp 0.50 [main]

  vcredist2017 14.16.27027.1 [extras]
```

## clipboard integration

<https://github.com/Microsoft/WSL/issues/892>

## Powershell tips

`Set-PSReadLineOption -EditMode Vi`

## wallpaper

<https://wallpaperscraft.com/catalog/nature/2560x1080>
