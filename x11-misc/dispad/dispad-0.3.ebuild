# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools vcs-snapshot

DESCRIPTION="Small daemon for disableing trackpads while typing."
HOMEPAGE="https://github.com/BlueDragonX/dispad"
SRC_URI="https://github.com/BlueDragonX/${PN}/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-libs/confuse
	x11-libs/libXi"
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README.md
}
