# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit autotools base games

DESCRIPTION="A general purpose, programmable physical simulator and renderer"
HOMEPAGE="http://www.nongnu.org/techne"
SRC_URI="mirror://nongnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-games/ode
	dev-lang/lua
	media-libs/fontconfig
	media-libs/freetype:2
	media-libs/libpng
	media-libs/openal
	sys-devel/gcc[objc]
	virtual/opengl"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS ChangeLog NEWS README )

src_prepare() {
	# Fix configure.ac for lua
	sed -i -e "s/lua5.1/lua/" -e "s/luac\]\]/luac]/" \
		configure.ac || die
	eautoreconf
}

src_install() {
	base_src_install
	prepgamesdirs
}
