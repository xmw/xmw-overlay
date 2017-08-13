# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="MSP430.DLLv3 Open Source Package contains the source code for the MSP Debug Stack"
HOMEPAGE="http://processors.wiki.ti.com/index.php/MSPDS_Open_Source_Package"
SRC_URI="http://www-s.ti.com/sc/techzip/slac460.zip -> ${PN}-slac460k.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-libs/boost-1.53[threads]
	dev-libs/hidapi
	virtual/pkgconfig"

S=${WORKDIR}/MSPDebugStack_OS_Package

src_prepare() {
	epatch "${FILESDIR}"/${P}-hidapi.patch
}

src_compile() {
	local my_make_args=(
		CXX="$(tc-getCXX)"
		CXXFLAGS="${CXXFLAGS} -fPIC"
		DEFINES="-DUNIX $(usex debug "" -DNDEBUG)"
	)
	emake "${my_make_args[@]}" -C ThirdParty/BSL430_DLL
	emake "${my_make_args[@]}"
}

src_install() {
	dolib.so libmsp430.so
	dodoc revisions.txt
}
