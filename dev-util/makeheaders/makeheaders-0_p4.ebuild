# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit toolchain-funcs

DESCRIPTION="simple utility that will automatically generate header files"
HOMEPAGE="http://www.hwaci.com/sw/mkhdr/"
SRC_URI="http://www.hwaci.com/sw/mkhdr/makeheaders.c"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	local my_a
	for my_a in ${A} ; do
		cp -v "${DISTDIR}"/"${my_a}" . || die
	done
}

src_compile() {
	$(tc-getCC) ${CFLAGS} -o ${PN} ${PN}.c ${LDFLAGS} || die
}

src_install() {
	dobin ${PN} || die
}
