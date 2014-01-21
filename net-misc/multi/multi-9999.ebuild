# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="command line network manager for Linux, with proper support for multihoming"
HOMEPAGE="https://github.com/kristrev/multi"
EGIT_REPO_URI="https://github.com/kristrev/multi.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/${P}-LDFLAGS.patch
}

src_compile() {
	emake -C src
}

src_install() {
	dobin src/multi_client
	dodoc README.md
}
