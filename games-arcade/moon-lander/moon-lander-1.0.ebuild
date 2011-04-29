# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils games toolchain-funcs

DESCRIPTION="SDL game based on the classic moon lander"
HOMEPAGE="http://packages.debian.org/source/sid/moon-lander"
SRC_URI="mirror://debian/pool/main/${PN:0:1}/${PN}/${PN}_${PV}.orig.tar.gz
	mirror://debian/pool/main/${PN:0:1}/${PN}/${PN}_${PV}-4.diff.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/libsdl
	media-libs/sdl-image
	media-libs/sdl-mixer"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

src_prepare() {
	epatch ${WORKDIR}/${PN}_${PV}-4.diff
	sed -e '/^CFLAGS/s: -Wall : :' \
		-e 's:-lSDL_mixer:-lSDL_mixer $(LDFLAGS):' \
		-i Makefile || die
	rm ${PN}{,.bin} || die
}

src_compile() {
	emake CC="$(tc-getCC)" || die
}

src_install() {
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r fonts images sounds || die

	dogamesbin ${PN} || die

	doicon debian/${PN}.xpm || die
	make_desktop_entry /usr/games/bin/${PN} "Moon Launcher"

	doman debian/${PN}.6 || die
	dodoc debian/{changelog,copyright} || die

	prepgamesdirs
}
