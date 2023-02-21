<div align="center">
    <h1>🐧 Dot Files 🐧</h1>
    <h3>🍙 My personal Arch linux configuration files 🍙</h3>
</div>

<div align="center">

![](https://img.shields.io/github/last-commit/Ngz91/dotfiles?&style=for-the-badge&color=C9CBFF&logoColor=D9E0EE&labelColor=3D426B)
![](https://img.shields.io/github/stars/Ngz91/dotfiles?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=3D426B)
[![](https://img.shields.io/github/repo-size/Ngz91/dotfiles?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=3D426B)](https://github.com/Ngz91/dotfiles)
<a href="https://github.com/Ngz91/dotfiles/issues">
<img alt="Issues" src="https://img.shields.io/github/issues/Ngz91/dotfiles?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=3D426B" />
</a>

![](https://github.com/Ngz91/dotfiles/raw/master/gifs/Oregairu-Yukino.gif)

</div>

# Preview:
![](https://raw.githubusercontent.com/Ngz91/dotfiles/master/screenshots/ArchPreview1.png)
![](https://raw.githubusercontent.com/Ngz91/dotfiles/master/screenshots/ArchPreview2.png)

# Details:

- OS:              [Arch](https://archlinux.org/)
- WM:              [i3](https://i3wm.org/)
- Terminal:        [Kitty](https://sw.kovidgoyal.net/kitty/)
- Shell:           [Zsh](https://www.zsh.org/)
- Status Bar:      [Polybar](https://polybar.github.io/)
- Launcher:        [Rofi](https://github.com/davatorium/rofi)
- Compositor:      [Picom](https://github.com/yshui/picom)
- File Manager:    [Ranger](https://github.com/ranger/ranger)
- IDE:             [Nvim](https://neovim.io/)

# Installation Guide (WIP)

First install Arch linux following the installation steps in the Arch linux [official installation guide](https://wiki.archlinux.org/title/installation_guide) or use the archinstall package to automate the installation process.

To install Arch using The ArchInstall package check your internet connection first running:
```
ping https://archlinux.org/
```
And then use this command:
```
python -m archinstall --script guided
```

You'll see a promp giving you some options similar to this:
(Add promp image here)

Select the options that better work for you but for my case and configuration the options are:
- language: English
- keyboard layout: us
- mirror region: Worldwide
- harddrives: *VM or partition hardrive here* ext4, wipe all selected...
- encryption pwd: *encryption password* None
- bootloader: systemd-bootct1
- swap: True
- hostname: *Name of the host machine*
- root pwd: *rootpassword*
- user account: *superuser name and password*
- profile: desktop -> i3 -> i3-gaps -> AMD/ATI (open-source)
- audio: pipewire
- kernel: linux
- additional packages: firefox, vim
- network: Copy ISO network conf...
- timezone: *your timezone*
- automatic time synch: true
- Additional repos: multilib

After cheking that the options are correct select Install.

Congrats Arch is now installed :tada:

Now let's get to the painless Arch configuration part:

(continue)
