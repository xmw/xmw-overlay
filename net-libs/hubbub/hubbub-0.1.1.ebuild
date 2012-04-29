# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit multilib netsurf

DESCRIPTION="HTML5 compliant parsing library, written in C"

KEYWORDS="~amd64 ~x86"
IUSE="doc static-libs"

RDEPEND="dev-libs/libparserutils"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	virtual/libiconv
	doc? ( app-doc/doxygen )
	test? ( dev-lang/perl
		dev-libs/json-c )"

# json_object_get_string_len does not exist!
RESTRICT="test"

NETSURF_PC_FILE=lib${PN}.pc.in
