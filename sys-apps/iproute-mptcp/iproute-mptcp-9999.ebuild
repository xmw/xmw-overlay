# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2 toolchain-funcs

DESCRIPTION="IP-Route extensions for MultiPath TCP"
HOMEPAGE="https://github.com/multipath-tcp/iproute-mptcp"
EGIT_REPO_URI="https://github.com/multipath-tcp/iproute-mptcp.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="atm"

DEPEND="arm? ( net-dialup/linux-atm )"
RDEPEND="${DEPEND}
	!sys-apps/iproute2"

src_configure() {
	tc-export CC AR
	default
}
