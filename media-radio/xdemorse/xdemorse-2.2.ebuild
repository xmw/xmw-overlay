# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit autotools

DESCRIPTION="GTK+ based Morse code signal decoder"
HOMEPAGE="http://www.qsl.net/5b4az/pages/morse.html"
SRC_URI="http://www.qsl.net/5b4az/pkg/morse/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/alsa-lib"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

src_prepare() {
	eautoreconf
}

src_install() {
	default

	dodoc doc/Morsecode.txt
	dohtml doc/${PN}.html
	dodoc doc/.${PN}rc

	elog "In order to capture audio, please copy .${PN}rc from"
	elog "/usr/share/doc/${PF} into your home dir."
}
