# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Versatile Open Source Control Solution"
HOMEPAGE="https://v-control.com/"
SRC_URI="https://v-control.com/download/516/ -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

MY_PN=V-Control3_Lin
S=${WORKDIR}/${MY_PN}

src_install() {
	insinto /opt/${PN}

	insopts -m0666
	touch v-control.ini
	doins v-control.ini
	doins Devices.rsd

	insopts -m0755
	doins "${MY_PN}"
	doins "${MY_PN} Libs"/XojoGUIFramework32.so
	doins "${MY_PN} Libs"/libc++.so.1

	insinto /opt/${PN}/"${MY_PN} Libs"
	doins "${MY_PN} Libs"/libR*

	make_wrapper ${PN} /opt/${PN}/"${MY_PN}"
}
