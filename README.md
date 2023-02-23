<div align="center">
    <h1>🐧 Dot Files & guide 🐧</h1>
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

After booting into session you will see a black screen and a bar at the bottom of the screen, all in the incorrect resolution. i3 will then ask if you want a configuration to be created for you, select yes and this will create a configuration file at .config/i3 named config where you can add your keybindings, exec commands, etc. If you want to familiarize yourself with the i3 WM I recommend reading their [user guide](https://i3wm.org/docs/userguide.html).

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

To make this changes permanent nevigate to .config/i3 on your terminal and open in vim the config file that's there. Then add these lines to the end of the file. (If you don't know how to use vim use [this cheat sheet](https://vim.rtorr.com/))
```
exec --no-startup-id xrandr --output *screen-name* --mode 1920x1080
exec --no-startup-id feh --bg-scale $HOME*/Downloads/some-example-image.jpg*
```

Now save the file and exit vim.
<div>
<img src=https://raw.githubusercontent.com/Ngz91/dotfiles/master/images/Quit_Vim_Editor.jpg width="300" height="300" />
</div>
(:q+enter to exit vim)
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

Test the audio. In case it's laggy or choppy make sure these packages are installed
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
sudo pacman -S ripgrep fzf xsel nodejs npm lazygit git python-pip thunar-archive-plugin zip
```

To render japanese characters install these packages
```
sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts
```

## Yay installation

<div align="center">
<img src=https://raw.githubusercontent.com/Ngz91/dotfiles/master/gifs/yogurt-anime.gif width="500" height="280" />
</div>

Yay is an AUR Helper Written in Go. We will use it to install some packages that are not in the official package repo or the version that is it's outdated. Visit the official [github repository](https://github.com/Jguer/yay) for the installation steps or run this command:
```
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

## Kitty installation
<div align="center">
<img src=https://raw.githubusercontent.com/Ngz91/dotfiles/master/gifs/wiggle.gif width="500" height="280" />
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

## Nerd Fonts installation
Nerd fonts add glyphs and icons to your terminal, this will allow, for example, Neovim to render icons. Visit [their page](https://www.nerdfonts.com/) to learn more about them. We will need to install some of them, you can install and use any one that you want, but to install them I'll use the ones I use for my configuration.

First make a .fonts folder in the same directory where .config is, then download [JetBrains Mono](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip), [Products Sans](https://github.com/iamverysimp1e/fonts/raw/master/product-sans.zip) and all [Material Design Icons](https://github.com/google/material-design-icons/tree/master/variablefont) except the ones that end with .codepoints. Unpack them and place them in place them into `~/.fonts` or `~/.local/share/fonts.` Then run this command for your system to detect the new fonts:
```
fc-cache -fv
```

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

## Picom

<div align="center">
<img src=https://raw.githubusercontent.com/Ngz91/dotfiles/master/gifs/disappearing.gif width="500" height="280" />
</div>

Picom is a window compotior, in our case it will let us have transparent windows. Install it by running:
```
sudo pacman -S picom
```
Start Picom by running `picom` in your terminal, you will see that the terminal is now transparent, but the same goes for all other windows that you have open. We need to fix this.

To modify Picom behavior create or edit the picom.conf file at .config folder, in this case the config file does not need to be in a folder. If you want transparency to be applied to a specific window open your terminal and type:
```
xprop
```
Click on the window that you want to apply the transparency and look for WM_CLASS(STRING), add this to your configuration. (I'll use kitty for this example)
```
opacity-rule = [
    "85:class_g = 'kitty' && focused",
    "85:class_g = 'kitty' && !focused",
];
```
This tells picom to follow this opacity rules for the specific program that's running. Now, the same rules can be applied if you don't want the window to have any transparency, for exaple, I don't want firefox to hae any opacity. To achieve that is add this to the conf file.
```
"100:class_g = 'firefox'",
```
As a side note, Picom uses backends for rendering, some of them handle features that others can't. The default one is xrender, but you can try others at your own risk. Here is a [manual](https://man.archlinux.org/man/picom.1.en) explaining other options available for configuration. In case Picom hangs your computer, open a console by pressing `Ctrl+Alt+F2`, log in and change the backend line.

To run Picom on start up add this line to your i3 config file:
```
exec --no-startup-id picom
```
If you are having problems with picom configuration copy my conf file and from there edit what you want and what not.

## Rofi
Rofi is an App launcher, with it you can easily search and launch installed apps. It also works for browsing files and commands. To install it run:
```
sudo pacman -S rofi
```
Then run it using `rofi --show drun`

Create a rofi folder in your config and [add this files](https://github.com/iamverysimp1e/dots/tree/main/configs/rofi), this will give you a start for you to customize your own rofi theme.

In case you want a rofi theme similar to mine follow [this guide](https://github.com/adi1090x/rofi)

To assign rofi a keybinding add this to your i3 config file:
```
exec --no-startup-id sh rofi -show drun
```

## Polybar

<div align="center">
<img src=https://raw.githubusercontent.com/Ngz91/dotfiles/master/gifs/doug-walker-sped-up.gif width="500" height="280" />
</div>

Polybar is a highly customizable status bar. Install it by running:
```
sudo pacman -S polybar
```
Then create a polybar folder in .config to hold your configuration. Polybar configuration deserves a guide on it's own but you can set one basic one following this steps. First copy my polybar config files to your polybar folder. In the same folder grand permissions to these files:
```
chmod +x launch.sh
chmod u+x scripts/diskusage
chmod u+x scripts/memory
chmod u+x scripts/network
```
Then add this i3 config file:
```
exec --no-startup-id sh ~/.config/polybar/launch.sh
```

Polybar is pretty well documented, you can read the documentation in [their repository](https://github.com/polybar/polybar/wiki/) if you have any doubt.

## Ranger and Zathura
(continue)

## Spotify & Spicetify
<div align="center">
<img src=https://raw.githubusercontent.com/Ngz91/dotfiles/master/gifs/persona-persona3.gif width="500" height="280" />
</div>
