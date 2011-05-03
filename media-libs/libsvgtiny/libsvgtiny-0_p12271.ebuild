# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit netsurf

DESCRIPTION="implementation of SVG Tiny, written in C"
SRC_URI="http://xmw.de/mirror/${PN}/${P}-src.tar.gz"

KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

RDEPEND=""
DEPEND="dev-util/gperf
	dev-util/pkgconfig"

DOCS=( README )
