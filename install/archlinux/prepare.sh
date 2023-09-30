#!/bin/bash

# Configure timezone
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc

# Configure localization
echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo ja_JP.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=jp106" > /etc/vconsole.conf

# Show messages
echo Please setup hostname: 'echo "${hostname}" > /etc/hostname'

# Configure bootloader
efi_dir="/boot"
bootctl --path=${efi_var} install
echo "default arch.conf" > ${efi_dir}/loader/loader.conf
echo "timeout 0" >> ${efi_dir}/loader/loader.conf
echo "editor no" >> ${efi_dir}/loader/loader.conf
echo "title Arch Linux" > ${efi_dir}/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> ${efi_dir}/loader/entries/arch.conf
echo "initrd /intel-ucode.img" >> ${efi_dir}/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> ${efi_dir}/loader/entries/arch.conf
root_part=$(df / --output=source | tail -n 1)
echo "options root=\"PARTUUID=$(blkid -s PARTUUID -o value ${root_part})\" rw" >> ${efi_dir}/loader/entries/arch.conf

# Install build dependency
pacman -S --noconfirm base-devel git sudo intel-ucode
