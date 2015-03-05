# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="collection of tools related to the MSP430 embedded processor"
HOMEPAGE="https://pythonhosted.org/python-msp430-tools/"
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-embedded/libmsp430"
DEPEND=""

PATCHES=( "${FILESDIR}"/${P}-scripts-filenames.patch)
S=${WORKDIR}/${PN}

src_prepare() {
	distutils-r1_src_prepare

	sed -i -e 's:libMSP430.so:libmsp430.so:g' \
		scripts/msp430-jtag-legacy.py \
		msp430/jtag/{jtag,target}.py \
		doc/{internals,target}.rst \
		doc/README-msp430-jtag.txt || die
}
