# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2

DESCRIPTION="command line network manager for Linux, with proper support for multihoming"
HOMEPAGE="https://github.com/kristrev/multi"
EGIT_REPO_URI="https://github.com/kristrev/multi.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/glib
	dev-libs/libyaml
	net-libs/libmnl
	net-wireless/wireless-tools"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-LDFLAGS.patch
}

src_compile() {
	emake -C src
}

src_install() {
	dobin src/multi_client
	dodoc README.md
}
