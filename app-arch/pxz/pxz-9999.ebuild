# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="git://github.com/jnovy/pxz.git"

inherit git-2 toolchain-funcs

DESCRIPTION="Parallel LZMA compressor/decompressor"
HOMEPAGE="http://jnovy.fedorapeople.org/pxz"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="app-arch/xz-utils"
DEPEND="${RDEPEND}"

pkg_setup() {
	tc-export CC
}

src_install() {
	dobin ${PN} || die
	doman ${PN}.1 || die
}
