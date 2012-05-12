# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
EHG_REPO_URI="https://code.google.com/p/liero/"

inherit eutils games mercurial

DESCRIPTION="Almost exact clone of Liero"
HOMEPAGE="http://code.google.com/p/liero/"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="media-libs/libsdl
	media-libs/sdl-mixer"
DEPEND="${RDEPEND}
	dev-libs/gvl
	dev-util/ftjam"

S=${WORKDIR}/${PN}

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
	newgamesbin _bin/openliero ${PN} || die
	prepgamesdirs
}

pkg_postinst() {
	elog "${PN} requires the original Liero files in order to run properly."
	elog "Visit http://www.liero.be/ and download a Liero package. Unpack it"
	elog "and run ${PN} inside a directory with Liero."
}
