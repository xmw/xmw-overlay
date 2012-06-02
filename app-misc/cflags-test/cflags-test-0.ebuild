# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit flag-o-matic

DESCRIPTION="Just fool around with append-cflags"
HOMEPAGE="http://xmw.de/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	einfo CFLAGS before ${CFLAGS}
	append-cflags -m32
	einfo CFLAGS after ${CFLAGS}
}

