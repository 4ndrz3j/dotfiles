# Documentation

## TODOS

- Prio 1
  - Make this documentation readeable and production ready.
  - Add .zsh config (with aliases for nvim, export editor etc.) 
- Prio 2
  - Add help
  - Add icon pack
  - Nicer Rice

## Startup/Shutdown files

```.zprofile``` and ```.zlogout``` is intended to use for startup/shutdown files.

## Display/login manager

There is no standard display manager. i3 is stared using ```.zprofile```

## Opacity

Opacity is achived using compton

## Packages
| Package
| Shell             | zsh + OhMyZsh|
| Terminal Emulator | Alacritty|
| Window manager    | i3wm |
| Status Bar        | i3blocks|
| dmenu replacment  | Rofi|
| Web Browser       | Librewolf|
| Text Editor       | neovim |
| Theme             | Arc Dark|
| Fonts             | Roboto Mono + Iosevka|

### Other Software

- xcwd

# Install

First run **install_arch.sh**. Read config and make a proper changes for your
setup.


#Backup your system!
#Bakcup your system!
#Did you backuped your system?

#Connect to internet

#Załaduj polską klawiaturę
loadkeys pl
#Ustaw polską czcionkę
setfont Lat2-Terminus16.psfu.gz -m 8859-2
#Ustaw ntp
timedatectl set-ntp true
#Ustaw partycje takie jakie chcesz
cfdisk
#Format disk
mkfs.ext4 /dev/sdX1
#And so on
#mout disks
mount /dev/sdX1 /mnt
#Install base staff
pacstrap /mnt efibootmgr base linux linux-firmware nano networkmanager xorg i3 grub git sudo
#TO DO wybrać display manager (do logowania)
#Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab
#chroot now
acrh-chroot /mnt
systemctl enable NetworkManager
systemctl start NetworkManager
#UWAGA - Przeczytaj instalacje gruba, w zależności od tego w jakim trybie
(BIOS/MBR/GPT UEFI/EFI uruchomił Ci się system!)
grub-install /dev/vdaX
grub-mkconfig -o /boot/grub/grub.cfg

passwd root
adduser user

mkinitcpio -P












#Encrypted part
#Sprawdź czy Twój system został uruchomiony w trybie UEFI
ls /sys/firmware/efi/efivars
#Jeżeli system został uruchomiony w trybie uefi, wybierz label partycji DOS
#W trybie legacy BIOS - wybierz gpt
#Spartycjonuj dyski zgodnie z uznaniem

#Załaduj moduły do szyfrowania
modprobe dm-crypt
modprobe dm-mod

#Zaszyfruj partycje, ALE nie boot
cryptsetup -y -v luksFormat /dev/sda2
cryptsetup open /dev/sda2 cryptroot
mkfs.ext4 /dev/mapper/cryptroot
mount /dev/mapper/cryptroot /mnt

#zrób fs na partycji boot
mkfs.ext4 /dev/sda1
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

#Install base and base-devel

pacstrap -i /mnt base base-devel linux nvim

#generate fstab
genfstab -U -p /mnt >> /mnt/etc/fstab

arch-chroot /mnt

#Zmień hasło
passwd 
