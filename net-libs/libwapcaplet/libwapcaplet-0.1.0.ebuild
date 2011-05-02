# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit flag-o-matic multilib

DESCRIPTION="string internment library, written in C"
HOMEPAGE="http://www.netsurf-browser.org/projects/libwapcaplet/"
SRC_URI="http://www.netsurf-browser.org/projects/releases/${P}-src.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test static-libs"

RDEPEND=""
DEPEND="${RDEPEND}
	test? (	dev-libs/check )"

S=${WORKDIR}/${P}-src

src_configure() {
	sed -e "/^INSTALL_ITEMS/s: /lib: /$(get_libdir):g" \
		-i Makefile || die
	sed -e "/^libdir/s:/lib:/$(get_libdir):g" \
		-i ${PN}.pc.in || die
}

src_compile() {
	emake COMPONENT_TYPE=lib-shared || die
	if use static-libs ; then
		emake COMPONENT_TYPE=lib-static || die
	fi
}

src_install() {
	emake COMPONENT_TYPE=lib-shared DESTDIR="${D}" PREFIX=/usr install || die
	if use static-libs ; then
		emake COMPONENT_TYPE=lib-static DESTDIR="${D}" PREFIX=/usr install || die
	fi
	dodoc README || die
}
