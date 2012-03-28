# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="https://github.com/keithw/mosh.git"

inherit autotools eutils git-2

DESCRIPTION="remote terminal supporting intermittent connectivity, roaming, and speculative local echo"
HOMEPAGE="http://mosh.mit.edu"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+client examples +server +utempter"

RDEPEND="dev-lang/perl
	dev-libs/protobuf
	sys-libs/ncurses:5
	virtual/ssh
	utempter? ( sys-apps/utempter )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-buildsystem.patch
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable client) \
		$(use_enable server) \
		$(use_enable examples) \
		$(use_enable utempter)
}

src_install() {
	default

	for myprog in $(find src/examples -type f -perm /0111) ; do
		newbin ${myprog} ${PN}-$(basename ${myprog})
		elog "${myprog} installed as ${PN}-$(basename ${myprog})"
	done
}
