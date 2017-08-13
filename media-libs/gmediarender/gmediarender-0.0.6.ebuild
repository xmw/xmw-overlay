# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="UPnP media renderer for POSIX-compliant systems"
HOMEPAGE="http://gmrender.nongnu.org/"
SRC_URI="http://savannah.nongnu.org/download/gmrender/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="media-plugins/gst-plugins-soup:0.10
	net-libs/libupnp"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -e '/#include <stdio.h>/a#include <string.h>' \
		-i src/upnp.c \
		-i src/upnp_connmgr.c \
		-i src/upnp_device.c \
		-i src/upnp_transport.c \
		-i src/webserver.c \
		|| die
}
