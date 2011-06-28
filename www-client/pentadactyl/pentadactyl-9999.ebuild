# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EHG_REPO_URI=https://dactyl.googlecode.com/hg/

inherit mercurial mozextension multilib

DESCRIPTION="Firefox addon, designed to make browsing more efficient and especially more keyboard accessible"
HOMEPAGE="http://dactyl.sourceforge.net/pentadactyl/"
SRC_URI=""

LICENSE="${PN}"
SLOT="0"
KEYWORDS=""
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
	xpi_unpack "${S}"/downloads/pentadactyl-1* || die
	MOZILLA_FIVE_HOME=/usr/$(get_libdir)/firefox \
		xpi_install "${WORKDIR}"/pentadactyl-1* || die
	dodoc AUTHORS Donors NEWS TODO || die
}
