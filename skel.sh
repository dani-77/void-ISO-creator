#!/bin/bash

cp -r skel/ mklive-build.*/image/rootfs/etc/
cp 50-udisks.rules mklive-build.*/image/rootfs/usr/share/polkit-1/rules.d/
cp rofi-power-menu mklive-build.*/image/rootfs/usr/bin/
cp wswap-way mklive-build.*/image/rootfs/usr/bin/
