# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils netsurf

DESCRIPTION="a free, open source web browser"
HOMEPAGE="http://www.netsurf-browser.org"

LICENSE="MIT GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="bmp fbcon freetype gif gtk jpeg mng pdf png svg webp"

RDEPEND="media-fonts/dejavu"
DEPEND="${RDEPEND}
	net-libs/hubbub
	bmp? ( media-libs/libnsbmp )
	gif? ( media-libs/libnsgif )
	pdf? ( media-libs/libharu )
"

S=${WORKDIR}/${PN}

src_prepare() {
	netsurf_src_prepare
	sed -e "/cp nsgtk/s:netsurf:nsgtk.real:" \
		-e "/cp -v/s:netsurf:nsfb.real:" \
		-e "s:\@cp:cp:" \
		-i Makefile || die
	sed -e "/DEJAVU_PATH/s:truetype/ttf-::" \
		-i framebuffer/font_freetype.c || die
}

src_configure() {
	netsurf_conf() {
		echo "override $1" >> Makefile.config
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
	netsurf_use svg NETSURF_USE_NSSVG NO NO
	netsurf_use svg NETSURF_USE_RSVG YES NO
	netsurf_use svg NETSURF_USE_ROSPRITE NO NO
	netsurf_use webp NETSURF_USE_WEBP
	netsurf_conf "NETSURF_FB_FRONTEND := linux"
}

src_compile() {
	use gtk && ( emake TARGET=gtk || die )
	use fbcon && ( emake TARGET=framebuffer || die )
}

src_install() {
	if use gtk ; then
		emake TARGET=gtk PREFIX="${ED}usr" install || die

		echo "#!/bin/sh" >> nsgtk || die
		echo "NETSURFRES=${EPREFIX}/usr/share/netsurf ${EPREFIX}/usr/bin/nsgtk.real \"\$@\"" >> nsgtk || die
		dobin nsgtk || die

		insinto /usr/share/pixmaps
		doins gtk/res/netsurf.xpm || die
		make_desktop_entry /usr/bin/nsgtk NetSurf-gtk netsurf "Network;WebBrowser"
	fi

	if use fbcon ; then
		emake TARGET=framebuffer PREFIX="${D}" install || die

		echo "#!/bin/sh" >> nsgtk || die
		echo "NETSURFRES=${EPREFIX}/usr/share/netsurf ${EPREFIX}/usr/bin/nsfb.real \"\$@\"" >> nsfb || die
		dobin nsfb || die

		insinto /usr/share/pixmaps
		doins gtk/res/netsurf.xpm || die
		make_desktop_entry /usr/bin/nsfb NetSurf-fb netsurf "Network;WebBrowser"
	fi

	dodoc ChangeLog README || die
}
