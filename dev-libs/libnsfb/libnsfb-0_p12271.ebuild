# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit netsurf

DESCRIPTION="framebuffer abstraction library, written in C"
SRC_URI="http://xmw.de/mirror/${PN}/${P}-src.tar.gz"

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="dev-util/pkgconfig"

DOCS=( usage )

RESTRICT=test
