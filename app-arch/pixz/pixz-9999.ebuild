# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="http://github.com/vasi/pixz.git"

inherit git-2 toolchain-funcs

DESCRIPTION="parallel, indexing version of XZ"
HOMEPAGE="https://github.com/vasi/pixz"
SRC_URI=""

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=app-arch/libarchive-2.8
	app-arch/xz-utils"
DEPEND="${RDEPEND}"

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS} -std=gnu99" \
		LDFLAGS="${LDFLAGS}" || die
}

src_install() {
	dobin ${PN} || die
	dodoc README TODO || die
	elog "Take a look into the README file for usage information"
}
