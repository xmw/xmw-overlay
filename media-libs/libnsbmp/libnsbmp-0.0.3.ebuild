# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit multilib

DESCRIPTION="decoding library for BMP and ICO image file formats, written in C"
HOMEPAGE="http://www.netsurf-browser.org/projects/libnsbmp/"
SRC_URI="http://www.netsurf-browser.org/projects/releases/${P}-src.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

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
src_test() {
	emake COMPONENT_TYPE=lib-shared test || die
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr COMPONENT_TYPE=lib-shared install || die
	if use static-libs ; then
		emake DESTDIR="${D}" PREFIX=/usr COMPONENT_TYPE=lib-static install || die
	fi
}
