# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils mercurial

DESCRIPTION="Lytro Linux"
HOMEPAGE="https://bitbucket.org/stativ/lyli/"
EHG_REPO_URI="https://bitbucket.org/stativ/lyli"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="qt5"

RDEPEND="media-libs/opencv"
DEPEND="${RDEPEND}
	dev-libs/jsoncpp
	media-libs/libusbpp
	virtual/pkgconfig
"

PATCHES=( 
	"${FILESDIR}"/${P}-jsoncpp-include.patch
	"${FILESDIR}"/${P}-system-libusbpp.patch
)

src_configure() {
	if ! $(use qt5) ; then
		comment_add_subdirectory ui
	fi

	cmake-utils_src_configure
}

src_install() {
	dobin "${BUILD_DIR}"/${PN}
	if $(use qt5) ; then
		dobin "${BUILD_DIR}"/ui/${PN}-qt
	fi
}
