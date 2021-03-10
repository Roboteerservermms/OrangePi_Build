#!/bin/bash

KERNEL_VER=$(whiptail --title "Orange Pi Build System" \
        --menu "$MENUSTR" 10 40 3 --cancel-button Finish --ok-button Select \
	"1"  "linux4.9" \
	"2"  "mainline" \
        3>&1 1>&2 2>&3)

SCRIPTS=("scripts" "master")
EXTERNAL=("external" "master")
TOOLCHAIN=("toolchain" "aarch64-linux-gnu-4.9")

if [ "${KERNEL_VER}" = "0" ]; then
	PLATFORM="OrangePiH6"
	KERNEL=("linux-orangepi" "orange-pi-5.4")
	UBOOT=("u-boot-orangepi" "v2020.04")
elif [ "${KERNEL_VER}" = "1"  ];then
	PLATFORM="OrangePiH6_Linux4.9"
	KERNEL=("linux-orangepi" "orange-pi-4.9-sun50iw6")
	UBOOT=("u-boot-orangepi" "v2014.07-sun50iw6-linux4.9")
elif [ "${KERNEL_VER}" = "2"  ];then
	PLATFORM="OrangePiH6_mainline"
	KERNEL=("linux-orangepi" "orange-pi-5.4")
	UBOOT=("u-boot-orangepi" "v2020.04")
	TOOLCHAIN=("toolchain" "aarch64-linux-gnu-7.4.1")
fi

ORANGEPI_GIT="https://github.com/orangepi-xunlong"
