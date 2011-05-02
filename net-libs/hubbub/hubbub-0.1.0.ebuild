# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit multilib

DESCRIPTION="HTML5 compliant parsing library, written in C"
HOMEPAGE="http://www.netsurf-browser.org/projects/hubbub"
SRC_URI="http://www.netsurf-browser.org/projects/releases/${P}-src.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc static-libs"

RDEPEND=""
DEPEND="${RDEPEND}
	net-libs/libparserutils
	virtual/libiconv
	doc? ( app-doc/doxygen )
	test? ( dev-lang/perl
		dev-libs/json-c
		dev-util/pkgconfig )"

S=${WORKDIR}/${P}-src

src_configure() {
	sed -e "/^INSTALL_ITEMS/s:/lib:/$(get_libdir):g" \
		-e "s:-Werror::" \
		-i Makefile || die
	sed -e "/^libdir/s:/lib:/$(get_libdir):g" \
		-i libhubbub.pc.in || die
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

# json_object_get_string_len does not exist!
src_test() {
	return
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
