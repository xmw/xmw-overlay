# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Raspberry PI boot loader and firmware"
HOMEPAGE="https://github.com/raspberrypi/firmware"
SRC_URI="http://xmw.de/mirror/raspberrypi-firmware/${P}.tar.xz"

LICENSE="GPL-2 raspberrypi-videocore-bin"
SLOT="0"
KEYWORDS="~arm -*"
IUSE=""

S=${WORKDIR}

QA_PRESTRIPPED="boot/start.elf
	boot/arm224_start.elf
	boot/arm192_start.elf
	boot/arm128_start.elf"

src_prepare() {
	echo "root=/dev/mmcblk0p2 rootdelay=2" > boot/cmdline.txt
}

src_install() {
	insinto /boot
	doins boot/*
}
