# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="https://github.com/Nadrin/xlsh.git"
inherit git-2 pam toolchain-funcs

DESCRIPTION="eXtended Login Shell"
HOMEPAGE="https://github.com/Nadrin/xlsh"
SRC_URI=""

LICENSE="GPL-1"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="sys-libs/pam
	sys-libs/readline"
DEPEND="${RDEPEND}"

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" || die
}

src_install() {
	emake DESTDIR="${D}" prefix=/usr install || die
	dopamd etc/pam.d/${PN}d || die
	dodoc README || die
}
