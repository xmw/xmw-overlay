# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit autotools vcs-snapshot

DESCRIPTION="controller and terminal for the mySmartUSB"
HOMEPAGE="https://github.com/b52/mysmartctl"
SRC_URI="https://github.com/b52/mysmartctl/tarball/8cb2da38 -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -e "s:@PACKAGE@:@PACKAGE@-${PV}:" \
		-i data/Makefile.am

	eautoreconf
}
