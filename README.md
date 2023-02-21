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

After booting into session you will see a black screen and a bar at the bottom of the screen, all in the incorrect resolution. i3 will then ask if you want a configuration to be created for you, select yes.

To fix the resolution open your terminal with Mod+enter and run this command (The Mod key is most likely your Windows key):
```
xrandr
```
This will give you a list with different screens and their resolution, select the one you wish to use and run this command:
```
xrandr --output *screen name here* --mode 1920x1080
```

Next, run this command to synch and upgrade Arch packages:
```
sudo pacman -Syu
```

Also, if you wish to change your wallpaper run this commands:
```
sudo pacman -S feh
feh --bg-scale $HOME*/Downloads/some-example-image.jpg*
```

To make this changes permanent nevigate to .config/i3 on your terminal and open in vim the config file that's there. Then add these lines to the end of the file
```
exec --no-startup-id xrandr --output *screen-name* --mode 1920x1080
exec --no-startup-id feh --bg-scale $HOME*/Downloads/some-example-image.jpg*
```

If the config file or the .config folder do not exist in your machine, then create the .config folder and inside of it create an i3 folder, this will hold the i3 configuration for the current user. Navigate to the i3 folder and create a config file with vim running vim config, copy [this configuration](https://github.com/i3/i3/blob/next/etc/config) and run :w+enter inside of vim to save the file. Then at the end of the file add the lines aforementioned (This will be a good time to familiarize yourself with the i3 keybindings, like Mod+arrowKeys to navigate through the windows).

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

## Some packages to install
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

Also, install these packages, they will be needed.
```
sudo pacman -S ripgrep fzf xsel nodejs npm lazygit git python-pip
```

To render japanese characters install these packages
```
sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts
```

## Yay installation
Yay is an AUR Helper Written in Go. We will use it to install some packages that are not in the official package repo or the version that is it's outdated. Visit the official [github repository](https://github.com/Jguer/yay) for the installation steps or run this command:
```
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

## Kitty installation
<div align="center">
<img src=https://raw.githubusercontent.com/Ngz91/dotfiles/master/gifs/wiggle.gif width="300" height="250" />
</div>

Kitty is a GPU based terminal emulator. Install it by running:

```
sudo pacman -S kitty
```

Then change the i3 configuration to open kitty instead of the default terminal by adding this line to the i3 config file
```
bindsym $mod+Return exec kitty
```
You can change kitty's theme in .config/kitty/kitty.conf. Add my configuration or use the one you like. In [this repo](https://github.com/dexpota/kitty-themes) there are some themes that might be of interest.

## Zsh & Oh-my-zsh

<div align="center">

![](https://github.com/Ngz91/dotfiles/raw/master/gifs/shirogane-screaming.gif)

</div>

Install Zsh by running:
```
sudo pacman -S zsh zsh-completions
```
Change your default shell by running
```
chsh -s /bin/zsh
```
And finally install Oh-my-szh by running
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
It will ask you if you want to make zsh your default shell, select yes. Exit your terminal and launch it again and you will see the terminal in a different style.

To change the theme of oh-my-zsh change this line in ~/.zshrc
```
ZSH_THEME="robbyrussel"
```
And load it using:
```
source .zshrc
```

## Nerd Fonts installation
(continue)
