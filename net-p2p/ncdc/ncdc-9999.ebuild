# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="git://g.blicky.net/ncdc.git"

inherit autotools git-2

DESCRIPTION="ncurses directconnect client"
HOMEPAGE="http://dev.yorhel.nl/ncdc"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="app-arch/bzip2
	dev-libs/glib
	dev-libs/libxml2
	sys-libs/gdbm
	sys-libs/ncurses"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/makeheaders"

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc README || die
}
