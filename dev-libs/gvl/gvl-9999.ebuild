# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit mercurial

DESCRIPTION="collection of versatile support libraries for C++"
HOMEPAGE="http://code.google.com/p/gvl/"
#EHG_REPO_URI="https://code.google.com/p/gvl/" #oiginal
EHG_REPO_URI="https://code.google.com/r/martinerikwerner-gvl/" #fork for gcc

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-util/ftjam"

S=${WORKDIR}/${PN}

src_compile() {
	jam -qa || die
}

src_test() {
	./_bin/gvltest || die
}

src_install() {
	dolib _bin/lib${PN}.a
	local my_header
	for my_header in $(find . -name "*.h" -o -name "*.hpp") ; do
		insinto /usr/include/gvl/$(dirname "${my_header}")
		doins "${my_header}"
	done
}
