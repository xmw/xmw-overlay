# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit multilib toolchain-funcs

DESCRIPTION="converts a digitized chaotic source into cryptographically strong random numbers"
HOMEPAGE="http://www.lavarnd.org/index.html"
SRC_URI="mirror://sourceforge/lavarnd/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e '/^POD2MAN=/d' \
		-e "s|/usr/lib|/usr/$(get_libdir)|" \
		-e "s|/usr/|${D}usr/|" \
		-e "s|/etc/|${D}etc/|" \
		-e "/must rebuiild perllib/,/perllib rebuilt/s:^:#:" \
		-i Makefile || die

	#no useradd/groupadd
	sed -e '/^install:/s: acct_setup : :' \
		-i daemon/Makefile || die

	#respect C/LDFLAGS
	sed -e '/^\(LDFLAGS\|CFLAGS\|CLINK\)=/s:=:+=:' \
		-i {daemon,lib/shared,perllib,tool}/Makefile || die

	#add soname
	sed -e '/${LSUF}/,+1s:${LDFLAGS}:${LDFLAGS} -Wl,-soname,$@:' \
		-i lib/shared/Makefile || die

	#fix inplicit declaration of exit
	sed -e '1i#include <stdlib.h>' \
		-i lib/LavaRnd/have/endian.c || die

	sed -e 's:(int)callback:(long)callback:' \
		-i lib/{fetchlava,random_libc}.c \
		-i lib/LavaRnd/lava_debug.h || die

	sed -e '/define PERL_UNUSED_DECL/d' \
		-i perllib/LavaRnd/*/ppport.h || die
}

src_compile() {
	local my_sub=""
	for my_sub in lib/shared daemon tool ; do
		emake -C ${my_sub} -j1 \
			CC="$(tc-getCC)" CC_WARN="" CC_OPT="" CC_DBG="" \
			LD="$(tc-getCC)" CLINK="${CFLAGS} ${LDFLAGS}" \
			DESTLIB="${EROOT}usr/$(get_libdir)"
	done
}

src_test() {
	LD_LIBRARY_PATH=${S}/lib/shared ./tool/chk_lavarnd || die
	LD_LIBRARY_PATH=${S}/lib/shared ./tool/camget list all || die
}

src_install() {
	dolib.so lib/shared/*.so

	dosbin daemon/{lavapool,lavaurl,ov511,pwc,trickle}

	insinto /etc/${PN}
	doins daemon/cfg.lavapool

	dodoc README-first doc/{CHANGES,README-{API,camera,config,tool},TODO}
}
