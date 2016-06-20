# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="implementation of SMPTE and the MXF Interop Sound & Picture Track File format"
HOMEPAGE="http://www.cinecert.com/asdcplib/"
SRC_URI="http://download.cinecert.com/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/openssl:0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
