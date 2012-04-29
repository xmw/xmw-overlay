# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit netsurf toolchain-funcs

DESCRIPTION="library for decoding RISC OS Sprite format bitmaps, written in C"
SRC_URI="http://xmw.de/mirror/${PN}/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=""

src_prepare() {
	netsurf_src_prepare
	sed -e "/^CFLAGS/,/^LDFLAGS/d" \
		-i Makefile || die
}

src_compile() {
	emake CC="$(tc-getCC)" || die
}
