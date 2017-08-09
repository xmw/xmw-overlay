# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils

DESCRIPTION="Tool to measure loudspeaker frequency and step responses and distortions"
HOMEPAGE="http://gaydenko.com/qloud/"
SRC_URI="http://gaydenko.com/qloud/download/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-qt/qtcore:4
	dev-qt/qtgui:4
	media-libs/libsndfile
	media-sound/jack-audio-connection-kit
	sci-libs/fftw:3.0
	x11-libs/qwt:6[qt4]"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}-buildsystem.patch )

src_configure() {
	eqmake4
}

src_install() {
	dobin bin/${PN}

	dodoc README
}
