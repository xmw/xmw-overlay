# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Morse code decoding application for the console"
HOMEPAGE="http://www.qsl.net/5b4az/pages/morse.html"
SRC_URI="http://www.qsl.net/5b4az/pkg/morse/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/alsa-lib"
DEPEND="${RDEPEND}"

src_install() {
	default

	dodoc doc/Morsecode.txt
	dohtml doc/${PN}.html
}
