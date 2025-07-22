#!/bin/bash
#after installation, please write EDITOR=nano visudo and scroll to the line %wheel ALL=(ALL) ALL, uncomment and save and exit, then write exit umount -R reboot . That's it
echo "enter your name:"
read name
echo "enter your password:"
read password
useradd -m -G wheel $name && passwd && sudo pacman -S grub efibootmgr os-prober mtools && $passwd && mkdir /boot/efi && mount /dev/sda1 /boot/efi && grub-install --target=x86_64-efi --bootloader-id=grub_uefi && grub-mkconfig -o /boot/grub/grub.cfg
