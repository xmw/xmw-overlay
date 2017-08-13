# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit autotools eutils

DESCRIPTION="Motion and still picture editing tool used for painting and retouching of movies"
HOMEPAGE="http://www.cinepaint.org/"
SRC_URI="http://xmw.de/mirror/${PN}/${P}.tar.bz2
	http://xmw.de/mirror/${PN}/${P}-patches.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="print"

# app-admin/elektra media-libs/oyranos
RDEPEND="
	x11-libs/fltk:1[opengl]
	x11-libs/gtk+:2
	dev-libs/glib
	x11-libs/pango
	media-libs/ftgl
	dev-libs/libxml2
	media-libs/ilmbase
	media-libs/jbigkit
	media-libs/jpeg
	media-libs/lcms
	media-libs/libpng
	media-libs/openexr
	media-libs/tiff
	sys-devel/libtool
	virtual/opengl
	x11-libs/cairo
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXinerama
	x11-libs/libXext
	x11-libs/libXmu
	x11-libs/libXpm
	x11-libs/libXrender
	x11-libs/libXt
	x11-libs/libXxf86vm
	x11-libs/libxcb
	x11-libs/pixman
	x11-libs/xcb-util
	print? ( net-print/gutenprint )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	dev-util/intltool
	sys-devel/flex
	sys-devel/gettext"

src_prepare() {
	epatch \
		"${WORKDIR}"/patches/implicitdecls.patch \
		"${FILESDIR}"/implicitdecls.patch \
		"${WORKDIR}"/patches/fix_gimp_layer_set_name_constness.patch \
		"${WORKDIR}"/patches/icc_examin.patch \
		"${WORKDIR}"/patches/make_install.patch \
		"${WORKDIR}"/patches/terminate_on_sigpipe.patch \
		"${WORKDIR}"/patches/window_icon.patch \
		"${WORKDIR}"/patches/python.patch
	einfo remove bundled icc_examin
	rm -r plug-ins/icc_examin || die
	sed -e '/AC_CONFIG_SUBDIRS(plug-ins\/icc_examin\/icc_examin)/d' \
		-e '/ICC_EXAMIN=/s:icc_examin::' \
		-e '/AC_MSG_RESULT(\[yes "$ICC_EXAMIN"\])/s:yes:no:' \
		-e '/^plug-ins\/icc_examin\/Makefile$/d' \
		-i configure.in || die

	# plug-ins/icc_examin/icc_examin has no configure.{in,ac}
	#AT_M4DIR=aclocal AT_NO_RECURSIVE=1 eautoreconf
	AT_M4DIR=aclocal eautoreconf
}

src_configure() {
	econf \
		--disable-gtktest \
		--disable-gtk1 \
		$(use_enable gutenprint print)

	# remove a Wl, w/o argument from FLTK_LIBS
	#sed -i "s: -Wl, : :" plug-ins/icc_examin/icc_examin/Makefile || die

	# respect LINGUAS 
	#sed -i -e '/^LINGUAS = /d' plug-ins/icc_examin/icc_examin/Makefile || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS BUGS NEWS README TODO tips.txt || die
}
