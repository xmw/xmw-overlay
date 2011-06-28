# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit mozextension multilib

DESCRIPTION="Firefox addon, designed to make browsing more efficient and especially more keyboard accessible"
HOMEPAGE="http://dactyl.sourceforge.net/pentadactyl/"
SRC_URI="http://xmw.de/mirror/${PN}/${P}.tar.bz2"

LICENSE="${PN}"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="|| (
		( >=www-client/firefox-3.5 <www-client/firefox-4.1 )
		( >=www-client/firefox-bin-3.5 <www-client/firefox-bin-4.1 ) )"
DEPEND="${DEPEND}
	app-arch/zip"

src_compile() {
	emake -C ${PN} xpi || die
}

src_install() {
	xpi_unpack "${S}"/downloads/${P/_beta/b}.xpi || die
	MOZILLA_FIVE_HOME=/usr/$(get_libdir)/firefox \
		xpi_install "${WORKDIR}"/${P/_beta/b} || die
	dodoc AUTHORS Donors NEWS TODO || die
}
