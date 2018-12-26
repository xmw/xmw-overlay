# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3

DESCRIPTION="CoAP (RFC 7252) implementation in C"
HOMEPAGE="https://github.com/obgm/libcoap"
EGIT_REPO_URI="https://github.com/obgm/${PN}.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE="doc examples profile +ssl gnutls test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable ssl dtls) \
		$(use_with gnutls) \
		$(use_with gnutls --without-openssl --with-openssl) \
		--disable-static \
		$(use_enable doc documentation) \
		--enable-manpages \
		$(use_enable profile gcov) \
		$(use_enable examples) \
		$(use_enable test tests)
}
