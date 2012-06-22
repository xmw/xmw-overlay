# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils linux-info toolchain-funcs

DESCRIPTION="Morse code decoding application for the console"
HOMEPAGE="http://www.qsl.net/5b4az/pages/morse.html"
SRC_URI="http://www.qsl.net/5b4az/pkg/morse/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/alsa-lib"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

CONFIG_CHECK="~SND_MIXER_OSS"

src_prepare() {
	epatch "${FILESDIR}"/${P}-Makefile.patch
	sed -e '/install/s:--strip::' \
		-i Makefile || die
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${D}" BINDIR=${ROOT}usr/bin \
		DOCDIR=${ROOT}usr/share/doc/${PF} install

	dodoc doc/Morsecode.txt
	dohtml doc/${PN}.html
}
