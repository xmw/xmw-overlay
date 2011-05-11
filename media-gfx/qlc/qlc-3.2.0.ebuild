# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit multilib qt4-r2

DESCRIPTION="cross-platform application to control DMX or analog lighting systems"
HOMEPAGE="http://qlc.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/Sources/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-embedded/libftdi
	dev-libs/libusb:0
	media-libs/alsa-lib
	sys-libs/glibc:2.2
	x11-libs/libX11
	x11-libs/qt-core:4
	x11-libs/qt-dbus:4
	x11-libs/qt-gui:4"
DEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_prepare() {
	sed -e "/^Categories/s:Lighting:Education:" \
		-i etc/qlc{,-fixtureeditor}.desktop	|| die

	sed -e "s:lrelease-qt4:/usr/bin/lrelease:g" \
		-i i18n.pri || die

	# fix multilib and install directory (i. e. ui/src/Makefile)
	sed -e "/^unix:!macx:LIBSDIR/s:lib:$(get_libdir):" \
		-i variables.pri || die
	export INSTALL_ROOT="${D}"
	export INSTALLROOT="${D}"
}

src_compile() {
	qt4-r2_src_compile -j1
}
