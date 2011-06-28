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
		( >=www-client/firefox-3.6 <www-client/firefox-8 )
		( >=www-client/firefox-bin-3.6 <www-client/firefox-bin-8 ) )"
DEPEND="${DEPEND}
	app-arch/zip"

src_compile() {
	emake -C ${PN} xpi || die
}

src_install() {
	xpi_unpack "${S}"/downloads/${PN}-1.0b7pre.xpi || die
	MOZILLA_FIVE_HOME=/usr/$(get_libdir)/firefox \
		xpi_install "${WORKDIR}"/${PN}-1.0b7pre || die
	dodoc AUTHORS Donors NEWS TODO || die
}
