# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 python3_4 )
inherit distutils-r1

DESCRIPTION="python interface to Clamd (Clamav daemon)"
HOMEPAGE="http://xael.org/norman/python/pyclamd/"
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
