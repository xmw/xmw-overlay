# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib vcs-snapshot

DESCRIPTION="Raspberry Pi userspace tools and libraries"
HOMEPAGE="https://github.com/raspberrypi/firmware"
MY_COMMIT="6cc27e02dd"
SRC_URI="https://github.com/raspberrypi/firmware/tarball/${MY_COMMIT} ->
	raspberrypi-firmware-${MY_COMMIT}.tar.gz"

LICENSE="BSD GPL-2 raspberrypi-videocore-bin"
SLOT="0"
KEYWORDS="~arm -*"
IUSE="+hardfp examples"

RDEPEND="!media-libs/raspberrypi-userland"
DEPEND="${DEPEND}"

S=${WORKDIR}/raspberrypi-firmware-${MY_COMMIT}

RESTRICT="binchecks"

src_prepare() {
	rm {,hardfp/}opt/vc/LICENCE || die
}

src_install() {
	cd $(usex hardfp hardfp/ "")opt/vc || die

	insinto /opt/vc
	doins -r include
	into /opt
	dobin bin/*
	dobin sbin/*
	insopts -m 0755
	insinto "/opt/vc/$(get_libdir)"
	doins -r lib/*

	insopts -m 0644
	insinto /usr/share/doc/${PF}/examples
	use examples && doins -r src/hello_pi

	doenvd "${FILESDIR}"/04${PN}
}