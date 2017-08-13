# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="combined WYSIWYG/text editor designed for editing Tikz code"
HOMEPAGE="http://www.tikzedt.org/"
SRC_URI="amd64? ( https://tikzedt.googlecode.com/files/${PN/-bin}_${PV//./_}_linux_amd64.tar.gz )
	x86? ( https://tikzedt.googlecode.com/files/${PN/-bin}_${PV//./_}_linux_x86.tar.gz )"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-lang/mono"
DEPEND=""

S=${WORKDIR}

src_install() {
	insinto /opt/${PN}
	insopts -m755
	doins -r .
}
