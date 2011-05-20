# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit toolchain-funcs

DESCRIPTION="viewer for binary files with a built-in binary, hexadecimal and disassembler editor"
HOMEPAGE="http://beye.sourceforge.net/en/beye.html"
MY_P=${PN}-${PV//./}
SRC_URI="mirror://sourceforge/beye/files/biew/${PV}/${MY_P}-src.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-libs/gpm"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -e 's:/man/man1:/share/man/man1:' \
		-i makefile || die
}

src_configure() {
	export CFLAGS
	export LDFLAGS
	econf \
		--cc="$(tc-getCC)" \
		--ld="$(tc-getCC)"
	sed -e "/OSLDEF/s: -s : :" \
		-i config.mak|| die
}

src_install() {
	emake DESTDIR="${D}" install || die
}
