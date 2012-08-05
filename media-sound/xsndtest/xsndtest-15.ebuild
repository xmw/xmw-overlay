# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="designed for testing and finding the optimum settings for your sound card"
HOMEPAGE="http://www.theory.physics.ubc.ca/soundcard/soundcard.html"
SRC_URI="http://www.theory.physics.ubc.ca/soundcard/sndcrd-test.15.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="x11-libs/xforms"
DEPEND="${RDEPEND}"

S=${WORKDIR}/sndcrd-test.15

src_prepare() {
	emake clean
	sed -e '/^CFLAGS=/d' \
		-e '/^LDFLAGS=/d' \
		-e 's:gcc:$(CC):' \
		-i Makefile || die
	sed -e '/#include <stdio.h>/i#include <stdlib.h>' \
		-i fft.c || die
	sed -e '/int nanosleep/d' \
		-i sndtest-main.c || die
}

src_compile() {
	emake CC=$(tc-getCC)
}

src_install() {
	dobin ${PN}
	dodoc Changes
}
