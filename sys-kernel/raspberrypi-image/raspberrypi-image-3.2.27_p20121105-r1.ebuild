# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit versionator

DESCRIPTION="Raspberry PI precompiled kernel and modules"
HOMEPAGE="https://github.com/raspberrypi/firmware"
SRC_URI="http://xmw.de/mirror/raspberrypi-firmware/${P}.tar.xz"

LICENSE="GPL-2 raspberrypi-videocore-bin"
SLOT="0"
KEYWORDS="~arm -*"
IUSE=""

S=${WORKDIR}

RESTRICT="binchecks strip"

src_install() {
	MY_PV=$(get_version_component_range 1-3)+
	insinto /boot
	newins boot/kernel.img kernel-${MY_PV}.img
	newins boot/kernel_cutdown.img kernel-${MY_PV}_cutdown.img
	newins boot/kernel_emergency.img kernel-${MY_PV}_emergency.img
	newins extra/System.map System-${MY_PV}.map
	newins extra/System_cutdown.map System-${MY_PV}_cutdown.map
	newins extra/System_emergency.map System-${MY_PV}_emergency.map
	newins extra/Module.symvers Module-${MY_PV}.symvers
	newins extra/Module_cutdown.symvers Module-${MY_PV}_cutdown.symvers
	newins extra/Module_emergency.symvers Module-${MY_PV}_emergency.symvers
	insinto /lib/modules
	doins -r modules/${MY_PV} modules/${MY_PV/+/-cutdown+}
}
