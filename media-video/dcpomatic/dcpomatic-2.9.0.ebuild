# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_3 python3_4 python3_5 )
PYTHON_REQ_USE="threads(+)"
inherit python-any-r1 waf-utils wxwidgets

DESCRIPTION="create Digital Cinema Packages (DCPs) from videos, images and sound files"
HOMEPAGE="http://dcpomatic.com/"
SRC_URI="http://${PN}.com/downloads/${PV}/${P}.tar.bz2
	https://waf.io/waf-1.8.21.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+gui"

RDEPEND="dev-cpp/cairomm
	dev-cpp/glibmm:2
	dev-cpp/libxmlpp:2.6
	dev-cpp/pangomm:1.4
	dev-libs/boost
	dev-libs/glib:2
	dev-libs/icu
	dev-libs/libcxml
	dev-libs/libzip
	dev-libs/openssl:0
	|| ( media-gfx/graphicsmagick media-gfx/imagemagick )
	media-libs/fontconfig:1.0
	media-libs/libdcp:1.0
	media-libs/libsamplerate
	media-libs/libsndfile
	media-libs/libsub:1.0
	>=media-video/ffmpeg-3
	net-libs/libssh
	net-misc/curl
	gui? ( x11-libs/gtk+:2
		x11-libs/wxGTK:3.0 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/${PN}-2.8.0-wxGTK3.patch
	"${FILESDIR}"/${PN}-2.8.0-no-ldconfig.patch
	"${FILESDIR}"/${PN}-2.8.0-desktop.patch
	)

src_prepare() {
	cp -v ../waf*/waf .

	default
}

src_configure() {
	waf-utils_src_configure $(usex gui "" "--disable-gui")
}
