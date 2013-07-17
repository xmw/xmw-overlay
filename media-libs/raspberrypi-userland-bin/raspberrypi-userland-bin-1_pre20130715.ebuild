# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot

DESCRIPTION="Raspberry Pi userspace tools and libraries"
HOMEPAGE="https://github.com/raspberrypi/firmware"
MY_COMMIT="9e9acf8978"
SRC_URI="https://github.com/raspberrypi/firmware/tarball/${MY_COMMIT} ->
	raspberrypi-firmware-${MY_COMMIT}.tar.gz"

LICENSE="BSD GPL-2 raspberrypi-videocore-bin"
SLOT="0"
KEYWORDS="~arm -*"
IUSE="+hardfp"

RDEPEND="!media-libs/raspberrypi-userland"
DEPEND="${DEPEND}"

S=${WORKDIR}/raspberrypi-firmware-${MY_COMMIT}

#RESTRICT="binchecks"

src_prepare() {
	rm {,hardfp/}opt/vc/LICENCE || die
}

src_install() {
	if use hardfp ; then
		mv hardfp/opt "${D}" || die
	else
		mv opt "${D}" || die
	fi
	doenvd "${FILESDIR}"/04${PN}
}
