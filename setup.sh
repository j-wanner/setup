#!/bin/bash

#=== mirror config
#==================================
#sed -i -e '/^Method.*/d' /etc/pacman-mirrors.conf; sed -i -e '/^OnlyCountry.*/d' /etc/pacman-mirrors.conf
#echo -e \\nMethod = rank\\nOnlyCountry = Japan >> /etc/pacman-mirrors.conf && pacman-mirrors --fasttrack

#=== locale
#==================================
sed -i -e 's/^.*ja_JP.UTF-8.*$/ja_JP.UTF-8 UTF-8/' /etc/locale.gen; locale-gen;
sed -i -e 's/^.*LANG.*$/LANG=ja_JP.UTF-8/' /etc/locale.conf; source /etc/locale.conf;

#=== packs    dbus...?
#==================================
pacman -S yay git --noconfirm && yay -Syu
pacman -S fcitx fcitx-configtool fcitx-mozc fcitx-qt5 fcitx-gtk3 otf-ipaexfont --noconfirm
rm /etc/fonts/conf.d/70-yes-bitmaps.conf; ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/; fc-cache -fv
