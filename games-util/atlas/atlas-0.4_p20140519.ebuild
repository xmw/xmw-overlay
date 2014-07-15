# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools games

DESCRIPTION="Chart Program to use with Flightgear Flight Simulator"
HOMEPAGE="http://atlas.sourceforge.net/"
SRC_URI="http://dev.gentoo.org/~xmw/atlas-0.4_p20140519.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="
	media-libs/freeglut
	>=media-libs/libpng-1.4
	net-misc/curl
	sys-libs/zlib
	virtual/glu
	virtual/jpeg
	virtual/opengl
"
DEPEND="${COMMON_DEPEND}
	>=dev-games/simgear-2.4.0
	media-libs/plib
"
RDEPEND="${COMMON_DEPEND}
	>=games-simulation/flightgear-2.4.0
"

src_prepare() {
	epatch "${FILESDIR}"/${P}-fg3.patch
	eautoreconf
}

src_configure() {
	egamesconf \
		--disable-dependency-tracking \
		--with-fgbase="${GAMES_DATADIR}"/flightgear \
		--enable-simgear-shared
}

pkg_postinst() {
	games_pkg_postinst
	elog "You now can make the maps with the following commands:"
	elog "${GAMES_BINDIR}/Map --atlas=${GAMES_DATADIR}/flightgear/Atlas"
	elog
	elog "To run Atlas concurrently with FlightGear use the following:"
	elog "Atlas --path=[path of map images] --udp=[port number]"
	elog "and start fgfs with the following switch (or in .fgfsrc):"
	elog "--nmea=socket,out,0.5,[host that you run Atlas on],[port number],udp"
	echo
}

pkg_postrm() {
	elog "You must manually remove the maps if you don't want them around."
	elog "They are found in the following directory:"
	echo
	elog "${GAMES_DATADIR}/flightgear/Atlas"
	echo
}
