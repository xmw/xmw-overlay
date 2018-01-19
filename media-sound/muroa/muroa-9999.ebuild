# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="multi room audio player"
HOMEPAGE="http://muroa.org"
EGIT_REPO_URI="https://github.com/martinrunge/muroa.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-libs/boost
	dev-libs/jsoncpp
	dev-libs/libxdiff
	dev-libs/log4cplus
	media-libs/alsa-lib
	media-libs/libsamplerate
	virtual/ffmpeg
	net-dns/avahi"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${P}-includes.patch
	"${FILESDIR}"/${P}-namespace.patch
	"${FILESDIR}"/${P}-samplerate-const-float.patch
)

src_prepare() {
	default

	rm -r 3rdparty/libxdiff-0.23 || die
	sed -e "/DESTINATION/s:lib:$(get_libdir):" \
		-i lib{mcommons,mstream,muroadaemon,sock++}/CMakeLists.txt || die
}
