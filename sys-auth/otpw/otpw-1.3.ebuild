# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils flag-o-matic pam toolchain-funcs

DESCRIPTION="one-time password login package"
HOMEPAGE="http://www.cl.cam.ac.uk/~mgk25/otpw.html"
SRC_URI="http://www.cl.cam.ac.uk/~mgk25/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="sys-libs/pam"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

src_prepare() {
	epatch "${FILESDIR}"/${P}-buildsystem.patch
	append-cflags -fPIC
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LD="$(tc-getCC)" || die
}

src_install() {
	dopammod pam_otpw.so || die
	dobin demologin otpw-gen || die

	dodoc CHANGES || die
	doman otpw-gen.1 pam_otpw.8 || die
	dohtml otpw.html || die
}
