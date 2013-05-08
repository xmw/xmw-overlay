# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2 toolchain-funcs

DESCRIPTION="simple stopwatch and timer, written in GTK3"
HOMEPAGE="https://github.com/Unia/gtimeutils"
EGIT_REPO_URI="git://github.com/Unia/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-Makefile.patch
	tc-export CC
}

src_install() {
	emake PREFIX=/usr DESTDIR="${D}" install
}
