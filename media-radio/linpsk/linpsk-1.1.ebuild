# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit qt4-r2

DESCRIPTION="PSK31 encoder/decoder using alsa and qt4"
HOMEPAGE="http://linpsk.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/alsa-lib
	sci-libs/fftw:3.0
	x11-libs/qt-gui:4"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

src_prepare() {
	sed -e '/^target.path/s:local/::' \
		-i src/src.pro || die
}

src_install() {
	qt4-r2_src_install

	dodoc ChangeLog asoundrc

	elog "LinPSK now uses the alsa sound system."
	elog "The names of the used alsa devices are LinPSK_Record and LinPSK_Play."
	elog "To map these names to your soundcard edit the file asoundrc in the linpsk directory"
	elog "appropriately and append it to .asoundrc in your homedirectory."
	elog "If no .asoundrc exists copy the edited asoundrc to .asoundrc in your homedirectory."
	elog "You can find it at ${ROOT}usr/share/doc/${PF}."
}
