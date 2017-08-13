# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit toolchain-funcs

DESCRIPTION="utility to control the sndio master and per-program volume"
HOMEPAGE="http://www.sndio.org/"
SRC_URI="http://www.sndio.org/aucatctl-0.1.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-sound/sndio"
DEPEND="${RDEPEND}"

src_prepare() {
	tc-export CC
}

src_install() {
	emake install \
		PREFIX=/usr MAN1_DIR=/usr/share/man/man1 DESTDIR="${D}"
}
