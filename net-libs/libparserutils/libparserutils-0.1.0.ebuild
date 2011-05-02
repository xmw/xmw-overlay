# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit flag-o-matic multilib

DESCRIPTION="library for building efficient parsers, written in C"
HOMEPAGE="http://www.netsurf-browser.org/projects/libparserutils"
SRC_URI="http://www.netsurf-browser.org/projects/releases/${P}-src.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc iconv static-libs"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	doc? ( app-doc/doxygen )
	test? (	dev-util/pkgconfig
		dev-lang/perl )"

S=${WORKDIR}/${P}-src

src_configure() {
	use iconv && append-cflags "-DWITH_ICONV_FILTER"
	sed -e "/^INSTALL_ITEMS/s:/lib:/$(get_libdir):g" \
		-i Makefile || die
	sed -e "/^libdir/s:/lib:/$(get_libdir):g" \
		-i libparserutils.pc.in || die
}

src_compile() {
	emake COMPONENT_TYPE=lib-shared || die
	if use static-libs ; then
		emake COMPONENT_TYPE=lib-static || die
	fi
	if use doc ; then
		emake docs || die
	fi
}

src_test() {
	emake test || die
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr COMPONENT_TYPE=lib-shared install || die
	if use static-libs ; then
		emake DESTDIR="${D}" PREFIX=/usr COMPONENT_TYPE=lib-static install || die
	fi
	dodoc README || die
	if use doc ; then
		dohtml build/docs/html/* || die
	fi
}
