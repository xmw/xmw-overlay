# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 toolchain-funcs

DESCRIPTION="simple Mode S decoder for RTLSDR devices"
HOMEPAGE="https://github.com/antirez/dump1090"
EGIT_REPO_URI="git://github.com/antirez/dump1090.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="net-wireless/rtl-sdr"
DEPEND="${RDEPEND}"

src_compile() {
	emake CC="$(tc-getCC)" \
		CFLAGS="$(pkg-config --cflags librtlsdr)" \
		LIBS="${LDFLAGS} $(pkg-config --libs librtlsdr) -lm -lpthread" \
		all
}

src_install() {
	dobin ${PN}
	dodoc TODO README.md
}
