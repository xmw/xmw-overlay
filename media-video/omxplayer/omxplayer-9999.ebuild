# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils flag-o-matic git-2 toolchain-funcs

DESCRIPTION="command line media player for the Raspberry Pi"
HOMEPAGE="https://github.com/huceke/omxplayer"
EGIT_REPO_URI="https://github.com/huceke/omxplayer.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/libpcre
	media-libs/rbpi-videocore-bin
	media-video/ffmpeg"
RDEPEND="${RDEPEND}
	sys-apps/fbset"

src_prepare() {
	epatch "${FILESDIR}"/${P}-Makefile.patch
	epatch "${FILESDIR}"/${P}-wrapper.patch
	tc-export CXX
	filter-ldflags -Wl,--as-needed
}

src_install() {
	dobin ${PN}{,.bin}
	dodoc README
}
