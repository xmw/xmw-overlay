# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_3 python3_4 python3_5 )
PYTHON_REQ_USE="threads(+)"
inherit python-single-r1 waf-utils

DESCRIPTION="small C++ library which makes it marginally neater to parse XML using libxml++"
HOMEPAGE="http://carlh.net/libcxml"
SRC_URI="http://carlh.net/downloads/libcxml/libcxml-0.15.1.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-cpp/libxmlpp:2.6
	dev-libs/boost"
DEPEND="${RDEPEND}"
