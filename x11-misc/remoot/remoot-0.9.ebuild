# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="script to let you control all major multimedia applications with one hotkey/remote"
HOMEPAGE="http://www.remoot.org/"
SRC_URI="mirror://sourceforge/${PN}/${PN}/${PV}/${P}.tar.bz2"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-lang/perl"
DEPEND=""

src_install() {
	dobin remoot{,-remote} daemoot
	dodoc README
}
