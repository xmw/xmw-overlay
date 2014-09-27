# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1 eutils

DESCRIPTION="Python interface to libpcap"
HOMEPAGE="http://sourceforge.net/projects/pylibpcap/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz
	https://sourceforge.net/p/pylibpcap/bugs/_discuss/thread/425683fd/a317/attachment/pylibpcap-0.6.4-py3.diff"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="net-libs/libpcap"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch ${DISTDIR}/${P}-py3.diff
}
