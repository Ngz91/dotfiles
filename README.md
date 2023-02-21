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

To install Arch using The ArchInstall package check your internet connection first by running:
```
ping https://archlinux.org/
```
And then run this command:
```
python -m archinstall --script guided
```

You'll see a promp giving you some options similar to this:
![](https://raw.githubusercontent.com/Ngz91/dotfiles/master/screenshots/archinstall-example.jpg)

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
- additional packages: firefox, vim, thunar
- network: Copy ISO network conf...
- timezone: *your timezone*
- automatic time synch: true
- Additional repos: multilib

After cheking that the options are correct select Install.

Congrats Arch is now installed :tada:

# Configuring Arch
<div align="center">

![](https://github.com/Ngz91/dotfiles/raw/master/gifs/anime-run.gif)

</div>

If you installed Arch in a virtual machine remember to remove the ISO file.

After booting into session you will see a black screen and a bar on the bottom of the screen all in the incorrect resolution, i3 will then ask if you want a configuration to be build for you, select yes.

To fix the resolution open your terminal with Mod+enter and run this command (The Mod key is most likely your Windows key):
```
xrandr
```
This will give you a list with different screens and their resolution, select the one you wish to use and use this command:
```
xrandr --output *screen name here* --mode 1920x1080
```

Also, if you wish to change your wallpaper open your terminal and run this commands:
```
sudo pacman -S feh
feh --bg-scale $HOME*/Downloads/some-example-image.jpg*
```

To make this changes permanent nevigate to .config/i3 on your terminal and open in vim the config file that`s there. Then add this lines to the end of the file
```
exec --no-startup-id xrandr --output *screen-name* --mode 1920x1080
exec --no-startup-id feh --bg-scale $HOME*/Downloads/some-example-image.jpg*
```

If config file or the .config folder does not exist in your machine, then create the .config folder and inside of it create an i3 folder, this will hold the i3 configuration for the current user. Navigate to the i3 folder and create a config file with vim running vim config, run :w+enter to save the file and copy my configuration deleting this lines:

```
exec --no-startup-id xrandr --output Virtual1 --mode 1920x1080
exec --no-startup-id killall back4.sh 
exec --no-startup-id sh back4.sh 0.025 ~/.config/gifs/room-animated.gif
exec --no-startup-id sh ~/.config/polybar/launch.sh
exec --no-startup-id picom
```
And subtitude them with the preceding ones (This will be a good time for you to familiarize yourself with the default i3 keybindings, like Mod+arrowKeys to navigate through the windows.).

Now save the file and exit vim.
<div>
<img src=https://raw.githubusercontent.com/Ngz91/dotfiles/master/images/Quit_Vim_Editor.jpg width="250" height="250" />
</div>
(:q+enter to quit vim)
<br/><br/>

Test this changes by rebooting into Arch
```
reboot
```

# Some packages to install
If you are on a VM install guest additions
```
sudo pacman -S virtualbox-guest-utils
```

Test the audio, in case it's laggy or choppy make sure these packages are installed
```
sudo pacman -S pipewire pipewire-{alsa,jack,media-session,pulse}
```

If you are on a VM follow [this guide](https://wiki.archlinux.org/title/VirtualBox/Install_Arch_Linux_as_a_guest).  In my case I only needed to add these lines to etc/modprobe.d/sound.conf
```
options snd-hda-intel vid=8086 pid=8ca0 snoop=0
options snd-intel8x0 ac97_clock=48000
```

# Kitty Installation
