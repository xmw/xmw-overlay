# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit flag-o-matic netsurf

DESCRIPTION="framebuffer abstraction library, written in C"
SRC_URI="http://xmw.de/mirror/${PN}/${P}-src.tar.gz"

KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

RDEPEND="<x11-libs/xcb-util-0.3.8"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS=( usage )

RESTRICT=test

src_prepare() {
	append-cflags -DNEED_HINTS_ALLOC
}
