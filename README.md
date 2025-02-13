# Void ISO creator

Hello,

this is intended to be an example/learning repo of how to create your own custom Void ISO; in this example I will be creating a Sway custom ISO.

## Intro/Start

To start, clone void-mklive repo.

```
git clone https://github.com/void-linux/void-mklive
```

Now clone this repo:

```
git clone https://github.com/dani-77/Void_ISO_creator
```

cd into void-mklive, copy and edit the mkiso.sh file:

```
cd void-mklive
cp mkiso.sh example.sh
nano example.sh
```

Create a Sway variant to make it look:

sway)
    PKGS="$PKGS $XORG_PKGS acpi apulse alsa-plugins-pulseaudio alsa-tools alsa-utils arc-theme bash-completion bc brighnessctl btop ca-certificates curl elogind firefox font-awesome6 font-hack-ttf foot gettext git gmrun grim inxi kitty mousepad nano NetworkManager network-manager-applet nerd-fonts-symbols-ttf neofetch octoxbps papirus-icon-theme pavucontrol polkit ranger rofi sddm sway swaybg swayidle swaylock SwayNotificationCenter tlp tlp-rdw udiskie ufw unzip usbutils util-linux vim void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree Waybar wget wlsunset wmenu xdg-user-dirs xdg-user-dirs-gtk xdg-utils xf86-input-synaptics xarchiver"
    SERVICES="$SERVICES dbus elogind sddm NetworkManager polkitd"
;;

After creating Sway variant, remove all variants except base; base is the core in which you will build and you will need for the custom ISO.

### Note:

The file *example.sh* is already created in this repo.

All the info above was just to let you know how I recommend you to do it and because from time to time, Void changes the way their scripts work and it is good to know what to change in case of need.

## Skel dir

If you want your liveISO with your custom dotfiles and configs, we will need to create a skel (dir)ectory; this dir will be copied to _mklive-build.*/image/rootfs/etc/_, being available live and after install to all users you create.

Like before with *example.sh*, I include a semi customized skel dir. The recommended contents of skel are:

~/.config/

~/Wallpaper/

~/.local/

~/.bashrc

~/.Xresources

You can add a lot more or less files or directories.

## Skel file

Now let's create a script to copy all we want to the liveISO.

Beacause usually I use only a WindowManager (WM), to automount external drives or USB thumbs I need an helper like udiskie; 

Udiskie needs a polkit rules file, and that way I will include it in _mklive-build.*/image/rootfs/usr/share/polkit-1/rules.d/_ ;

To poweroff/reboot/logout from the WM I will include rofi-power-menu in _mklive-build.*/image/rootfs/usr/bin/_ ;

To swap quick and easily the wallpaper I will include my script wswp-way in _mklive-build.*/image/rootfs/usr/bin/_ ;

To do all of this in a semi automatic way, I created a script file named *skel.sh*; this script will copy skel dir, udiskie rules, rofi-power-menu and wswap-way.


## Work

Now finally we have all we need to build our liveISO; copy the contents of this repo inside void-mklive, open 2 terminals and:


terminal1
```
sudo ./example.sh -b sway -- -K
```

terminal2 
```
sudo ./skel.sh
```

If you run skel.sh too early you will notice that it fails; it is normal, because all the packages needed to create the liveISO need to be downloaded, then verified and unpacked to create the live rootfs.
If you expect to see the unpacking of a late package, like util-linux to run the skel script, it won't fail.

After a few minutes, your ISO is ready.

Hope it has been helpful. 