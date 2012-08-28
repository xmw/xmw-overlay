# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils toolchain-funcs vcs-snapshot

DESCRIPTION="Free and simple TrueCrypt Implementation based on dm-crypt"
HOMEPAGE="https://github.com/bwalex/tc-play"
SRC_URI="https://github.com/bwalex/tc-play/tarball/v0.10 -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/libgcrypt
	sys-apps/util-linux
	sys-fs/lvm2"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -e '/CFLAGS+= -O3/d' \
		-e '/$(CC)/s:$: $(LDFLAGS):' \
		-i Makefile || die
	epatch "${FILESDIR}"/${P}-library.patch
}

src_compile() {
	tc-export CC
	emake SYSTEM=linux PBKDF_BACKEND=gcrypt program lib
}

src_install() {
	dobin ${PN}
	dolib lib${PN}.so
	doman ${PN}.{3,8}
	dodoc README
}
