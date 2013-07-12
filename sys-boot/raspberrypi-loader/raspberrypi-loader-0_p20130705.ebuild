# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit readme.gentoo

DESCRIPTION="Raspberry PI boot loader and firmware"
HOMEPAGE="https://github.com/raspberrypi/firmware"
#created with https://github.com/xmw/gentoo-raspberrypi-tools
SRC_URI="http://xmw.de/mirror/raspberrypi-firmware/${P}.tar.xz"

LICENSE="GPL-2 raspberrypi-videocore-bin"
SLOT="0"
KEYWORDS="~arm -*"
IUSE=""

S=${WORKDIR}

RESTRICT=binchecks

src_install() {
	insinto /boot
	doins boot/*
	newins "${FILESDIR}"/${P}-config.txt config.txt
	newins "${FILESDIR}"/${P}-cmdline.txt cmdline.txt
	newenvd "${FILESDIR}"/${P}-envd 90${PN}
	readme.gentoo_create_doc
}

DOC_CONTENTS="Please configure your ram setup by editing /boot/config.txt"
