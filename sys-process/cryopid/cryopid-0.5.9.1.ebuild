# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils linux-info

DESCRIPTION="Process freezing utility"
HOMEPAGE="http://cryopid.berlios.de"
SRC_URI="amd64? ( http://dagobah.ucc.asn.au/wacky/${P}-x86_64.tar.gz )
	x86? ( http://dagobah.ucc.asn.au/wacky/${P}-i386.tar.gz )"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/dietlibc
	sys-libs/zlib[static-libs]
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}/src

pkg_setup() {
	linux_config_src_exists
	get_version
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS} -I\"${KV_DIR}\"/include -Iarch -I.. -Wl,-t" -j1
}
