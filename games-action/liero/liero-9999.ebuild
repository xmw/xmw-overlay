# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
EHG_REPO_URI="https://code.google.com/p/liero/"

inherit eutils games mercurial

DESCRIPTION="Almost exact clone of Liero"
HOMEPAGE="http://code.google.com/p/liero/"
SRC_URI="http://www.liero.be/download/liero-1.35b2-bundle.zip"

LICENSE="BSD freedist WTFPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="media-libs/libsdl
	media-libs/sdl-mixer"
DEPEND="${RDEPEND}
	dev-libs/gvl
	dev-util/ftjam"

RESTRICT="fetch"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	mercurial_src_unpack
}

src_prepare() {
	sed -e '/^SubInclude TOP gvl/d' \
		-e '/^LINKLIBS/s: ;: -lgvl ;:' \
		-e '/^LinkLibraries/s: libgvl : :' \
		-i Jamfile || die
}

src_compile() {
	jam -qa || die "jam failed"
}

src_install() {
	insinto "${GAMES_DATADIR}"/${PN}
	doins ../liero-1.35b2-bundle/{LIERO.{CHR,DAT,EXE,SND},NAMES.DAT} || die

	exeinto "$(games_get_libdir)"
	newexe _bin/openliero ${PN} || die

	games_make_wrapper ${PN} "$(games_get_libdir)"/${PN} \
		"${GAMES_DATADIR}"/${PN}

	dodoc ../liero-1.35b2-bundle/{changes.txt,LIEROENG.TXT} || die
	prepgamesdirs
}
