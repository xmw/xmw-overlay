# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Openbox Key Editor, written in Python + PyGTK"
HOMEPAGE="https://code.google.com/archive/p/obkey/"
SRC_URI="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/pygtk"
DEPEND="${RDEPEND}"

src_install() {
	distutils-r1_src_install

	insinto /usr/share/applications
	doins misc/${PN}.desktop
}
