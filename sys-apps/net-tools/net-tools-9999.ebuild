# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2 toolchain-funcs

DESCRIPTION="Modified net-tools to support MPTCP"
HOMEPAGE="https://github.com/multipath-tcp/net-tools"
EGIT_REPO_URI="https://github.com/multipath-tcp/net-tools.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.89_p20140724-hostname.patch
}

src_configure() {
	tc-export CC
	yes "" | emake config
}