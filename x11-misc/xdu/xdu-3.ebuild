# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="displays tree structured data in graphical form"
HOMEPAGE="http://sd.wareonearth.com/~phil/xdu/"
SRC_URI="http://sd.wareonearth.com/~phil/xdu/xdu-3.0.tar.Z"

LICENSE="xdu"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXaw
	x11-libs/libXext
	x11-libs/libXmu
	x11-libs/libXpm
	x11-libs/libXt"
DEPEND="${RDEPEND}
	x11-misc/imake"

S=${WORKDIR}

src_prepare() {
	xmkmf
}

src_compile() {
	emake CC="$(tc-getCC)" CPP="$(tc-getCPP)" CFLAGS="${CFLAGS}"
}

src_install() {
	dobin ${PN}
	insinto /usr/share/X11/app-defaults
	newins XDu.ad XDu
	newman ${PN}.man ${PN}.man.1
}
