# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit flag-o-matic netsurf

DESCRIPTION="library for building efficient parsers, written in C"

KEYWORDS="~amd64 ~x86"
IUSE="doc iconv static-libs"

RDEPEND=""
DEPEND="doc? ( app-doc/doxygen )
	test? (	dev-lang/perl )"

DOCS=( README )

src_configure() {
	use iconv && append-cflags "-DWITH_ICONV_FILTER"
}
