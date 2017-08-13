# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils vcs-snapshot toolchain-funcs

DESCRIPTION="IP-Route extensions for MultiPath TCP"
HOMEPAGE="https://github.com/multipath-tcp/iproute-mptcp"
SRC_URI="https://github.com/multipath-tcp/iproute-mptcp/tarball/fda77b0 -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="atm"

DEPEND="arm? ( net-dialup/linux-atm )"
RDEPEND="${DEPEND}"

src_configure() {
	tc-export CC AR
	default
}
