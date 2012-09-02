# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools-utils cvs

DESCRIPTION="UPnP media renderer for POSIX-compliant systems"
HOMEPAGE="http://gmrender.nongnu.org/"
ECVS_SERVER="cvs.sv.gnu.org:/sources/gmrender"
ECVS_MODULE="gmrender"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="gstreamer xml"

RDEPEND="media-plugins/gst-plugins-soup:0.10
	net-libs/libupnp"
DEPEND="${RDEPEND}"

S=${WORKDIR}/gmrender

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_with gstreamer) \
		$(use_with xml libxml) \
		--with-libupnp
}
