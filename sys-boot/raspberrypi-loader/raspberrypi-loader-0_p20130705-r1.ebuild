# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit readme.gentoo

DESCRIPTION="Raspberry PI boot loader and firmware"
HOMEPAGE="https://github.com/raspberrypi/firmware"
#created with https://github.com/xmw/gentoo-raspberrypi-tools

MY_COMMIT=320084ac198fdcacd1e3cbcfc1818ea8d8410a9c

for my_src_uri in bootcode.bin fixup{,_cd,_x}.dat start{,_cd,_x}.elf ; do
	SRC_URI="${SRC_URI} https://github.com/raspberrypi/firmware/raw/${MY_COMMIT}/boot/${my_src_uri} -> ${P}-${my_src_uri}"
done

LICENSE="GPL-2 raspberrypi-videocore-bin"
SLOT="0"
KEYWORDS="~arm -*"
IUSE=""

S=${WORKDIR}

QA_PRESTRIPPED="boot/start.elf
	boot/start_cd.elf
	boot/start_x.elf"

src_unpack() { :; }

src_install() {
	insinto /boot
	local a
	for a in ${A} ; do
		newins "${DISTDIR}"/${a} ${a#${P}-}
	done
	newins "${FILESDIR}"/${P}-config.txt config.txt
	newins "${FILESDIR}"/${P}-cmdline.txt cmdline.txt
	newenvd "${FILESDIR}"/${P}-envd 90${PN}
	readme.gentoo_create_doc
}

DOC_CONTENTS="Please configure your ram setup by editing /boot/config.txt"
