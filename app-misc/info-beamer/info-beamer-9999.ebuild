# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-r3 toolchain-funcs

DESCRIPTION="allows to rapidly prototype interactive multimedia presentations using Lua"
HOMEPAGE="http://info-beamer.org/"
EGIT_REPO_URI="https://github.com/dividuum/info-beamer.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE="examples luajit"

RDEPEND="
	dev-libs/libevent
	media-libs/devil
	media-libs/ftgl
	media-libs/glew
	media-libs/glfw
	media-libs/glu
	media-video/ffmpeg
	luajit? ( dev-lang/luajit:2 )
	!luajit? ( <dev-lang/lua-5.2 )"
DEPEND="${RDEPEND}
	<dev-lang/lua-5.2
	virtual/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.0_pre3-pkgconfig.patch
}

src_compile() {
	emake $(usex luajit USE_LUAJIT=1 "") \
		CC="$(tc-getCC)"
}

src_install() {
	dobin ${PN}
	dodoc ChangeLog README.{md,tlsf.txt}
	use examples && dodoc -r samples/* contrib/remote
}
