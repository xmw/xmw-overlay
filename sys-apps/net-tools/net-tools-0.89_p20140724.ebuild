# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils vcs-snapshot toolchain-funcs

DESCRIPTION="Modified net-tools to support MPTCP"
HOMEPAGE="https://github.com/multipath-tcp/net-tools"
SRC_URI="https://github.com/multipath-tcp/net-tools/tarball/0dcc05b -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/${P}-hostname.patch
}

src_configure() {
	tc-export CC
	yes "" | emake config
}
