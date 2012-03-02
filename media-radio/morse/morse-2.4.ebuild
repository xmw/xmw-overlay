# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs virtualx

DESCRIPTION="Morse-code training program for aspiring radio hams"
HOMEPAGE="http://www.catb.org/~esr/morse/"
SRC_URI="http://www.catb.org/~esr/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa X"

RDEPEND="alsa? ( media-libs/alsa-lib )
	X? ( x11-libs/libX11 )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	sed -e '/^QSO/,+2s:$(CC):$(CC) $(LDFLAGS):' \
		-i qso.d/Makefile || die
	sed -e '/^morseX11/,+2s:$(X11LIBS):$(X11LIBS) $(LDFLAGS):' \
		-e '/^morseALSA/,+2s:$(ALSA_CFLAGS):$(ALSA_CFLAGS) $(LDFLAGS):' \
		-i morse.d/Makefile || die
	sed -e '/^morse:/,+2s:ln morse:#ln morse:' \
		-i {,morse.d/}Makefile || die
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" QSO
	if use alsa ; then
		emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" DEVICE=ALSA morse
	fi
	if use X ; then
		emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" DEVICE=X11 morse
	fi
}

src_test() {
	if use alsa ; then
		elog "cannot test morseALSA"
	fi
	if use X ; then 
		ln -sf morse.d/morseX11 morse || die
		Xemake testmorse
	fi
}

src_install() {
	dobin QSO
	if use alsa ; then
		dobin morse.d/morseALSA
	fi
	if use X ; then
		dobin morse.d/morseX11
	fi
	doman morse.1 QSO.1
	dodoc HISTORY README
}
