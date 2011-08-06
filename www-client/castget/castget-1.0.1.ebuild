# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base

DESCRIPTION="simple, command-line based RSS enclosure downloader"
HOMEPAGE="http://www.nongnu.org/castget/"
SRC_URI="mirror://nongnu/${PN}/${P}.tar.gz"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"

RDEPEND="dev-libs/glib
	dev-libs/libxml2
	media-libs/id3lib
	net-misc/curl
	sys-libs/zlib"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS ChangeLog NEWS README TODO )

src_configure() {
	econf $(use_enable static-libs static)
}
