# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_3 python3_4 python3_5 )
PYTHON_REQ_USE="threads(+)"
inherit python-single-r1 waf-utils

DESCRIPTION="create and read Digital Cinema Packages using JPEG2000 and WAV files"
HOMEPAGE="http://carlh.net/libdcp"
SRC_URI="http://carlh.net/downloads/libdcp/libdcp-1.3.3.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-cpp/glibmm:2
	dev-cpp/libxmlpp:2.6
	dev-libs/boost
	dev-libs/libcxml
	dev-libs/libsigc++:2
	dev-libs/libxml2
	dev-libs/openssl:0
	dev-libs/xmlsec
	media-libs/libasdcp-cth
	media-libs/openjpeg:0"
DEPEND="${RDEPEND}"
