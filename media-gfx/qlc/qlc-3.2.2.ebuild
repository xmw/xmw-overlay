# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils multilib qt4-r2

DESCRIPTION="cross-platform application to control DMX or analog lighting systems"
HOMEPAGE="http://qlc.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/Sources/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-embedded/libftdi
	dev-qt/qtcore:4
	dev-qt/qtdbus:4
	dev-qt/qtgui:4
	media-libs/alsa-lib
	sys-libs/glibc:2.2
	virtual/libusb:0
	x11-libs/libX11 "
DEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-fixtureeditor-Werror.patch"
	epatch "${FILESDIR}/${P}-unistd.patch"

	#fix parallel build
	sed -e '1iCONFIG += ordered' \
		-e "1iINSTALL_ROOT = ${D}" \
		-e "1iINSTALLROOT = ${D}" \
		-i variables.pri || die

	sed -e "/^Categories/s:Lighting:Education:" \
		-i etc/qlc{,-fixtureeditor}.desktop	|| die

	sed -e "s:lrelease-qt4:/usr/bin/lrelease:g" \
		-i i18n.pri || die

	# fix multilib and install directory (i. e. ui/src/Makefile)
	sed -e "/^unix:!macx:LIBSDIR/s:lib:$(get_libdir):" \
		-i variables.pri || die
}

src_install() {
	sed -e 's:image/ /usr:image/usr:g' \
		-i ui/src/Makefile \
		-i fixtureeditor/Makefile \
		-i plugins/enttecdmxusbout/src/Makefile \
		-i plugins/peperoniout/unix/Makefile \
		-i plugins/udmxout/src/Makefile \
		-i midiout/alsa/Makefile || die
	qt4-r2_src_install
}
