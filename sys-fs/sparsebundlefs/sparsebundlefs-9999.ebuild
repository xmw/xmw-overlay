# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="FUSE filesystem for reading Mac OS sparse-bundle disk images"
HOMEPAGE="https://github.com/torarnv/sparsebundlefs"
EGIT_REPO_URI="https://github.com/torarnv/sparsebundlefs.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="sys-fs/fuse:0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES=( "${FILESDIR}"/${P}-makesystem.patch )

src_install() {
	dobin ${PN}

	dodoc AUTHORS README.md
}
