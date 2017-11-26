# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 flag-o-matic toolchain-funcs

DESCRIPTION="C++ class wrapping most of the jack client functionality"
HOMEPAGE="http://x37v.info/projects/jackcpp/"
EGIT_REPO_URI="https://github.com/x37v/jackcpp.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}-buildsystem.patch )

src_prepare() {
	sed -e '/^PREFIX =/s/= .*/= \/usr/' \
		-e '/^CC =/d' \
		-e '/^CFLAGS =/d' \
		-e '/^LDFLAGS =/d' \
		-i.bak config.mk || die

	sed -e "s|/lib/|/$(get_libdir)/|" \
		-i.bak Makefile || die

	tc-export CC
	append-cflags "-I./include"

	default
}
