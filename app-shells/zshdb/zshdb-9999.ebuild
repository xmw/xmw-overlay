# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="https://github.com/rocky/${PN}.git"
inherit autotools git-2

DESCRIPTION="Debugger for zsh"
HOMEPAGE="https://github.com/rocky/zshdb#"
SRC_URI=""

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-shells/zsh"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -e '/test-run.sh/s:\\::' \
		-e '/test-tty.sh/d' \
		-i test/unit/Makefile.am || die

	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README THANKS || die
}
