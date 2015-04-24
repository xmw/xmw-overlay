# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-r3 toolchain-funcs

DESCRIPTION="command line media player for the Raspberry Pi"
HOMEPAGE="https://github.com/popcornmix/omxplayer"
EGIT_REPO_URI="https://github.com/popcornmix/omxplayer.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-libs/libpcre
	|| ( media-libs/raspberrypi-userland media-libs/raspberrypi-userland-bin )
	virtual/ffmpeg
	sys-apps/dbus
	sys-apps/fbset"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0_p20150421-Makefile.patch

	cat > Makefile.include << EOF
INCLUDES=-I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux
LIBS=-L/opt/vc/lib -lvchiq_arm -lvcos -lbcm_host -lEGL -lopenmaxil -lrt -lpthread
EOF

	tc-export CXX
}

src_compile() {
	emake ${PN}.bin
}

src_install() {
	dobin ${PN} ${PN}.bin
	dodoc README.md
}
