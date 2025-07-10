#!/bin/bash

echo "enter your name:"
read name
echo "enter your passwd:"
read passwd
mkfs.fat -F32 /dev/sda1 && mkfs.ext4 /dev/sda2 && mkfs.ext4 /dev/sda3 && mkswap /dev/sda4 && swapon /dev/sda4 && mount /dev/sda1 /boot/efi && mount /dev/sda2 /mnt && mount /dev/sda3 /mnt && pacstrap -K /mnt base-devel base fastfetch linux linux-firmware sudo nano && genfstab -U >> /mnt/etc/fstab && arch-chroot /mnt && useradd -m -G wheel $name && passwd && $passwd && sudo pacman -S grub efibootmgr os-prober mtools && $passwd && mkdir /boot/efi && mount /dev/sda1 /boot/efi && grub-install --target=x86_64-efi --bootloader-id=grub_uefi && grub-mkconfig -o /boot/grub/grub.cfg && exit && umount -R /mnt && reboot
