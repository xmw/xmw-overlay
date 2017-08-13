# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit qt4-r2

DESCRIPTION="highly configurable loogbook for linux"
HOMEPAGE="http://linlogbook.sourceforge.net/"
SRC_URI="mirror://sourceforge/linlogbook/${PN}/LinLogBook-${PV}/LinLog-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/LinLog

src_install() {
	dobin bin/${PN}
	dodoc BaseTables.sql

	elog "Please uncompress /usr/share/doc/${PF}/BaseTables.sql.* into your new ~/.LinLog directory"
}
