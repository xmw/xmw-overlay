# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit autotools python-single-r1

DESCRIPTION="Open Lighting Architecture is a framework for lighting control information"
HOMEPAGE="https://www.openlighting.org/ola/"
SRC_URI="https://github.com/OpenLightingProject/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="LGPL-2.1 GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test +e133 examples gcov http libftdi libusb +uart +osc python java"

RDEPEND=""
DEPEND="${RDEPEND}
	test? ( dev-util/cppunit )
	http? ( net-libs/libmicrohttpd )
	libftdi? ( dev-embedded/libftdi:0 )
	libusb? ( virtual/libusb:1 )
	osc? ( media-libs/liblo )
	java? ( dev-libs/protobuf )
	python? ( dev-libs/protobuf[python,${PYTHON_USEDEP}] )"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(usex test --enable-unittests --disable-unittests) \
		$(use_enable e133) \
		$(use_enable examples) \
		$(use_enable gcov) \
		$(use_enable http) \
		--disable-java-libs \
		--disable-ja-rule \
		$(use_enable libftdi) \
		$(use_enable libusb) \
		$(use_enable uart) \
		$(use_enable osc) \
		$(use_enable python python-libs) \
		--disable-rdm-tests \
		--disable-root-check \
		--disable-tcmalloc
}
