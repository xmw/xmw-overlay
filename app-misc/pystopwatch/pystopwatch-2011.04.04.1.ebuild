# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND=2

inherit python

DESCRIPTION="stopwatch with clock and two countdown functions that can minimize to the tray"
HOMEPAGE="http://xyne.archlinux.ca/projects/pystopwatch"
SRC_URI="http://xyne.archlinux.ca/src/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/pygtk:2"

S=${WORKDIR}/${PN}

src_prepare() {
	unpack ./man/${PN}.1.gz
}

src_install() {
	dobin ${PN}
	doman ${PN}.1
}
