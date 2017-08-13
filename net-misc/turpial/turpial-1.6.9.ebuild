# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7} )
DISTUTILS_NO_PARALLEL_BUILD=1

inherit distutils-r1

DESCRIPTION="Lightweight and feature full twitter client"
HOMEPAGE="http://turpial.org.ve/"
SRC_URI="http://files.turpial.org.ve/sources/stable/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="${PYTHON_DEPS}"
DEPEND="${PYTHON_DEPS}
	dev-python/Babel[${PYTHON_USEDEP}]"

