loadkeys no-latin1
timedatectl set-ntp true

gdisk /dev/sdc
+600MiB boot
Rest /-partition

mkfs.ext4 /dev/sda5
mkfs.ext4 /dev/sda6

mount /dev/sda6 /mnt -L mnt
mkdir /mnt/boot
mount /dev/sda5 /mnt/boot -L boot

pacstrap /mnt base base-devel systemd-swap
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Oslo /etc/localtime
hwclock --systohc

locale-gen (after enabling en_US and nb_NO in /etc/locale.gen)
sudo pacman -S neovim
nvim /etc/locale.conf (LANG=en_US.UTF-8)
echo "KEYMAP=dvorak-programmer" >> /etc/vconsole.conf
echo "helium" > /etc/hostname

mkdir /boot/efi
mount /dev/sdc2 /dev/efi

pacman -S refind-efi
refind-install

pacman -S intel-ucode

/etc/netctl/ethernet
sudo netctl start ethernet
sudo netctl enable ethernet

python3 zsh intel-ucode base-devel git exa tldr

GUI stuff
pacman -Syu xorg-server xorg xorg-xinit [choose libglv] xf86-video-ati mesa yaourt
nvim /etc/pacman.conf
yaourt -Sy i3-gaps
/home/jakobgm/.xinitrc

pacman -S rustup
rustup install stable
rustup default stable
yourt -S alacritty-git

pacman -S ttf-dejavu firefox
pacman -S python-pip 
source scripts/python.zsh

yaourt -S programmers-dvorak
setxkbmap dvp

pacman -S fzf ripgrep

yaourt -S polybar siji-git

pacman -S openssh
pacman -S feh
