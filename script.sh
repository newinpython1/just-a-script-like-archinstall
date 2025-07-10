#!/bin/bash

mkfs.fat -F32 /dev/sda1 && mkfs.ext4 /dev/sda2 && mkfs.ext4 /dev/sda3 && mkswap /dev/sda4 && swapon /dev/sda4 && mount /dev/sda1 /boot/efi && mount /dev/sda2 /mnt && mount /dev/sda3 /mnt && pacstrap -K /mnt base-devel base fastfetch linux linux-firmware sudo nano && genfstab -U /mnt >> /mnt/etc/fstab # i will add new file for you start it on arch-chroot /mnt
