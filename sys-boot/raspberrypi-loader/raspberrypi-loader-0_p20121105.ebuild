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
	boot/start_cd.elf"

src_prepare() {
	echo "root=/dev/mmcblk0p2 rootdelay=2" > boot/cmdline.txt
}

src_install() {
	insinto /boot
	doins boot/*

	elog "Please specify your cpu/gpu ram distribution by adding"
	elog "an gpu_mem=64 or gpu_mem=16 line to /boot/config.txt"
}
