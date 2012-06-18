# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit versionator

DESCRIPTION="Raspberry PI precompiled kernel and modules"
HOMEPAGE="https://github.com/raspberrypi/firmware"
SRC_URI="http://xmw.de/mirror/raspberrypi-firmware/${P}.tar.xz"

LICENSE="GPL-2 rbpi-videocore-bin"
SLOT="0"
KEYWORDS="~arm -*"
IUSE=""

S=${WORKDIR}

src_install() {
	MY_PV=$(get_version_component_range 1-3)+
	insinto /boot
	newins boot/kernel.img kernel-${MY_PV}.img
	newins extra/System.map System-${MY_PV}.map
	insinto /lib/modules
	doins -r modules/${MY_PV}
}
