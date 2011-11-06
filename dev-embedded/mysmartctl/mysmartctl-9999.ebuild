# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="https://github.com/b52/mysmartctl.git"
inherit autotools git-2

DESCRIPTION="controller and terminal for the mySmartUSB"
HOMEPAGE="https://github.com/b52/mysmartctl"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -e "s:@PACKAGE@:@PACKAGE@-${PV}:" \
		-i data/Makefile.am

	eautoreconf
}
