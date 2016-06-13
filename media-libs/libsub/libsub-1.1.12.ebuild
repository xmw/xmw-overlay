# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_3 python3_4 python3_5 )
PYTHON_REQ_USE="threads(+)"
inherit python-any-r1 waf-utils

DESCRIPTION="read and write subtitles in a few different formats"
HOMEPAGE="http://carlh.net/libsub"
SRC_URI="http://carlh.net/downloads/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="1.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-cpp/glibmm
	dev-cpp/libxmlpp
	dev-libs/boost:=
	dev-libs/libcxml
	dev-libs/openssl:0
	media-libs/libasdcp-cth"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES=( "${FILESDIR}"/${P}-no-ldconfig.patch )
