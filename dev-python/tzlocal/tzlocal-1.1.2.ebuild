# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit vcs-snapshot distutils-r1

DESCRIPTION="python module that tries to figure out what your local timezone is"
HOMEPAGE="https://github.com/regebro/tzlocal"
SRC_URI="https://github.com/regebro/tzlocal/archive/1.1.2.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DOCS=( CHANGES.txt README.rst )
