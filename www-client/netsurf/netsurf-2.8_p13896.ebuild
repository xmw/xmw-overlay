# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils netsurf toolchain-funcs

DESCRIPTION="a free, open source web browser"
HOMEPAGE="http://www.netsurf-browser.org"
SRC_URI="http://xmw.de/mirror/${PN}/${P}.tar.gz"

LICENSE="MIT GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="bmp fbcon gif gtk jpeg mng pdf png rosprite svg svgtiny truetype webp"
REQUIRED_USE="|| ( fbcon gtk )"

RDEPEND="dev-libs/libcss
	dev-libs/libxml2
	media-fonts/dejavu
	net-libs/hubbub
	net-libs/libdom
	bmp? ( media-libs/libnsbmp )
	fbcon? ( dev-libs/libnsfb )
	gif? ( media-libs/libnsgif )
	gtk? ( x11-libs/gtk+:2 )
	jpeg? ( virtual/jpeg )
	pdf? ( media-libs/libharu )
	png? ( media-libs/libpng )
	svg? (
		!svgtiny? ( gnome-base/librsvg:2 )
		svgtiny? ( media-libs/libsvgtiny ) )
	truetype? ( media-libs/freetype )
	webp? ( media-libs/libwebp )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	rosprite? ( media-libs/librosprite )"

src_prepare() {
	netsurf_src_prepare
	mv Makefile.config.override Makefile.config || die
	sed -e "/cp nsgtk/s:netsurf:nsgtk.real:" \
		-e "/cp -v/s:netsurf:nsfb.real:" \
		-e "s:\@cp:cp:" \
		-i Makefile || die
	sed -e "/DEJAVU_PATH/s:truetype/ttf-::" \
		-i framebuffer/font_freetype.c || die
	sed -e '/^GTKCFLAGS/,+12s:--cflags openssl:--cflags openssl librsvg-2.0:' \
		-i gtk/Makefile.target || die
	sed -e '/CFLAGS/s:--cflags libcurl:--cflags libcurl librsvg-2.0 libwebp:' \
		-e '/LDFLAGS/s:--libs libcss:--libs libcss librsvg-2.0 libwebp:' \
		-i framebuffer/Makefile.target || die
}

src_configure() {
	netsurf_conf() {
		echo "override $1" >> Makefile.config || die
	}
	netsurf_use() {
		local val=${4:-NO}
		use $1 && val=${3:-YES}
		echo "override $2 := $val" >> Makefile.config || die
	}
	netsurf_use bmp NETSURF_USE_BMP
	netsurf_use freetype NETSURF_FB_FONTLIB freetype internal
	netsurf_use gif NETSURF_USE_GIF
	netsurf_use jpeg NETSURF_USE_JPEG
	netsurf_use mng NETSURF_USE_MNG
	netsurf_use pdf NETSURF_USE_HARU_PDF
	netsurf_use png NETSURF_USE_PNG
	if use svgtiny ; then
		netsurf_use svg NETSURF_USE_NSSVG
		netsurf_use svg NETSURF_USE_RSVG NO
	else
		netsurf_use svg NETSURF_USE_NSSVG NO
		netsurf_use svg NETSURF_USE_RSVG
	fi
	netsurf_use rosprite NETSURF_USE_ROSPRITE
	netsurf_use webp NETSURF_USE_WEBP
	netsurf_conf "NETSURF_FB_FRONTEND := linux"
}

src_compile() {
	use gtk && emake TARGET=gtk
	use fbcon && emake TARGET=framebuffer
}

src_install() {
	if use gtk ; then
		emake TARGET=gtk PREFIX="${ED}usr" install

		echo "#!/bin/sh" > nsgtk || die
		echo "NETSURFRES=${EPREFIX}/usr/share/netsurf ${EPREFIX}/usr/bin/nsgtk.real \"\$@\"" >> nsgtk || die
		dobin nsgtk

		insinto /usr/share/pixmaps
		doins gtk/res/netsurf.xpm
		make_desktop_entry /usr/bin/nsgtk NetSurf-gtk netsurf "Network;WebBrowser"
	fi

	if use fbcon ; then
		emake TARGET=framebuffer PREFIX="${ED}usr" install

		echo "#!/bin/sh" > nsfb || die
		echo "NETSURFRES=${EPREFIX}/usr/share/netsurf ${EPREFIX}/usr/bin/nsfb.real \"\$@\"" >> nsfb || die
		dobin nsfb

		insinto /usr/share/pixmaps
		doins gtk/res/netsurf.xpm
		make_desktop_entry /usr/bin/nsfb NetSurf-fb netsurf "Network;WebBrowser"
	fi

	dodoc README
}
