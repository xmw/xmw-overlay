# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="pure DHCP python library"
HOMEPAGE="http://pydhcplib.tuxfamily.org/"
SRC_URI="http://pydhcplib.tuxfamily.org/download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-manpages.patch
	distutils-r1_src_prepare
}

src_install() {
	distutils-r1_src_install

	dodoc docs/dhcp_options_supported.txt
	if use examples ; then
		dodoc examples/*
	fi
}
