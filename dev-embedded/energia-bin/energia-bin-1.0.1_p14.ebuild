# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="electronics prototyping platform for Texas Instruments MSP430 LaunchPad"
HOMEPAGE="http://energia.nu/"
MY_PN=${PN/-bin}
MY_P=${MY_PN}-0101E0014
SRC_URI="amd64? ( http://energia.nu/downloads/downloadv3.php?file=${MY_P}-linux64.tgz -> ${P}-amd64.tar.gz )
	x86? ( http://energia.nu/downloads/downloadv3.php?file=${MY_P}-linux.tgz -> ${P}-amd64.tar.gz )"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

RESTRICT="binchecks strip"

src_install() {
	dodoc revisions.txt
	rm -r revisions.txt __MACOSX || die

	newicon lib/${MY_PN}_48.png ${PN}.png
	rm lib/energia_*.png || die
	make_desktop_entry ${PN}

	mkdir -p "${ED}"opt/${PN} || die
	mv -v * "${ED}"opt/${PN} || die

	make_wrapper ${PN} "${EROOT}"opt/${PN}/${MY_PN} "${EROOT}"opt/${PN}
}
