# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3

inherit toolchain-funcs

DESCRIPTION="places the current phase of the moon on your root window"
HOMEPAGE="http://xphoon.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="${DEPEND}
	x11-misc/imake"

src_prepare() {
	#fix missing exit in line 256
	sed -e "/stdio.h/i#include <stdlib.h>" \
		-i phase.c || die
}

src_configure() {
	xmkmf || die
}

src_compile() {
	emake CC="$(tc-getCC)" CCOPTIONS="${CFLAGS}" EXTRA_LDOPTIONS="${LDFLAGS}" || die
}

src_install() {
	dobin ${PN} || die
	newman ${PN}.man ${PN}.1 || die
	dodoc README || die
}
