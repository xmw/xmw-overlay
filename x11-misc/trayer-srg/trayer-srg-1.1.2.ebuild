# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils toolchain-funcs

DESCRIPTION="trayer fork with multi monitor support, cleaned up codebase and other fancy stuff"
HOMEPAGE="https://github.com/sargon/trayer-srg"
SRC_URI="https://github.com/sargon/trayer-srg/tarball/trayer-1.1.2 -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:2
	x11-libs/libX11
	x11-libs/libXmu"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_unpack() {
	unpack ${A}
	mv *-${PN}-* ${P} || die
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-{as-needed,cflags,panel_height}.patch
}

src_compile() {
	emake DEVEL=1 TARGET=${PN} CC="$(tc-getCC)" || die
}

src_install() {
	dobin ${PN} || die
	dodoc CHANGELOG CREDITS README TODO || die
}
