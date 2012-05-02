# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="shows different information on the normally-unused LEDs on your keyboard"
HOMEPAGE="http://sampo.kapsi.fi/ledcontrol/"
SRC_URI="http://sampo.kapsi.fi/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtk"

RDEPEND=""
DEPEND="${DEPEND}
	gtk? ( dev-libs/glib:1
		x11-libs/gtk+:1 )"

src_configure() {
	econf --disable-sysv-init \
		$(use_enable gtk gled) \
		$(use_enable gtk glibtest) \
		$(use_enable gtk gtktest)
}
