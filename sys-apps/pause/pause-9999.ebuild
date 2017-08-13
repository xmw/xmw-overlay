# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit flag-o-matic git-2 toolchain-funcs

DESCRIPTION="pause forever"
HOMEPAGE="https://github.com/chneukirchen/ignite"
EGIT_REPO_URI="https://github.com/chneukirchen/ignite.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile(){
	#replace-flags -O* -Os
	#replace-flags -Wl,-O* -Wl,-Os
	#append-cflags -static
	#append-cflags -fno-asynchronous-unwind-tables -fno-stack-protector
	#append-ldflags -Wl,-z -Wl,noexecstack
	cd ignite/util
	verbose() {
		echo $@
		$@
	}
	verbose $(tc-getCC) ${CFLAGS} ${LDFLAGS} -o ${PN} ${PN}.c
}

src_install(){
	cd ignite/util
	dobin ${PN}
	doman ${PN}.1
}
