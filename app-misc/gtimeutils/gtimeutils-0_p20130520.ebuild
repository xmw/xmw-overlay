# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils toolchain-funcs vcs-snapshot

DESCRIPTION="simple stopwatch and timer, written in GTK3"
HOMEPAGE="https://github.com/Unia/gtimeutils"
SRC_URI="https://github.com/Unia/${PN}/tarball/da49c34 -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/libcanberra
	x11-libs/gtk+:3
	x11-libs/libnotify"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-Makefile.patch
	tc-export CC
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
