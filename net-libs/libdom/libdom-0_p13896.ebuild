# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit multilib netsurf

DESCRIPTION="implementation of the W3C DOM, written in C"
SRC_URI="http://xmw.de/mirror/${PN}/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

RDEPEND="dev-libs/libparserutils
	dev-libs/libwapcaplet
	dev-libs/libxml2
	net-libs/hubbub"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

RESTRICT="test"
