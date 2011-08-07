# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="automatically download enclosures and other objects linked to from various types of RSS feeds"
HOMEPAGE="http://code.google.com/p/rssdler/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/feedparser"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}${PV//./}

src_install() {
	distutils_src_install
	elog "Place the output of \"rssdler --comment-config\""
	elog "as ~/.rssdler/config.txt for a first setup."

	dodoc README userFunctions.py || die
	elog "Take a look at /usr/share/doc/${PF}/{README,userFunctions.py}"
}
