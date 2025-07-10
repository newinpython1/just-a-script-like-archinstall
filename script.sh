#!/bin/bash

echo "enter your name:"
read name
echo "enter your passwd:"
read passwd
sudo fdisk /dev/sda && n && 1 && p && 2048 && +1GB && n && 2 && p && 2048 && +32GB && n && 3 && p && 2048 && +187GB && n && 4 && p && 2048 && +11GB && t && 1 && ef && w && q && mkfs.fat -F32 /dev/sda1 && mkfs.ext4 /dev/sda2 && mkfs.ext4 /dev/sda3 && mkswap /dev/sda4 && swapon /dev/sda4 && mount /dev/sda1 /boot/efi && mount /dev/sda2 /mnt && mount /dev/sda3 /mnt && pacstrap -K /mnt base-devel base fastfetch linux linux-firmware sudo nano && genfstab -U >> /mnt/etc/fstab && arch-chroot /mnt && useradd -m -G wheel $name && passwd && $passwd && sed -i s/sed -i s/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL <visudo> && sudo pacman -S grub efibootmgr os-prober mtools && $passwd && mkdir /boot/efi && mount /dev/sda1 /boot/efi && grub-install --target=x86_64-efi --bootloader-id=grub_uefi && grub-mkconfig -o /boot/grub/grub.cfg && exit && umount -R /mnt && reboot