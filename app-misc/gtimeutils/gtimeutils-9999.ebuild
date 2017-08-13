# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils git-2 toolchain-funcs

DESCRIPTION="simple stopwatch and timer, written in GTK3"
HOMEPAGE="https://github.com/Unia/gtimeutils"
EGIT_REPO_URI="git://github.com/Unia/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="media-libs/libcanberra
	x11-libs/gtk+:3
	x11-libs/libnotify"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0_p20130520-Makefile.patch
	tc-export CC
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
