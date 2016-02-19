# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-boot/raspberrypi-firmware/raspberrypi-firmware-1_pre20130807.ebuild,v 1.1 2013/08/15 18:21:47 xmw Exp $

EAPI=5

inherit readme.gentoo

DESCRIPTION="Raspberry PI boot loader and firmware"
HOMEPAGE="https://github.com/raspberrypi/firmware"
SRC_URI="https://github.com/raspberrypi/firmware/archive/1.20160209.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2 raspberrypi-videocore-bin"
SLOT="0"
KEYWORDS="~arm -*"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}/${P/raspberrypi-}

RESTRICT="binchecks strip"

pkg_preinst() {
	if ! grep "${ROOT}boot" /proc/mounts >/dev/null 2>&1; then
		ewarn "${ROOT}boot is not mounted, the files might not be installed at the right place"
	fi
}

src_configure() { :; }

src_compile() { :; }

src_install() {
	rm boot/{kernel{,7}.img,COPYING.linux,LICENCE.broadcom} || die
	insinto /boot
	doins -r boot/*

	newenvd "${FILESDIR}"/${PN}-0_p20130711-envd 90${PN}
	readme.gentoo_create_doc
}

DOC_CONTENTS=" config.txt and cmdline.txt need to be generated by you
More information here:
https://www.raspberrypi.org/documentation/configuration/config-txt.md
Another good source http://elinux.org/RPi_config.txt
http://elinux.org/RPi_cmdline.txt"
