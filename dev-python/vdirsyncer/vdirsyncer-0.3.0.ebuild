# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="synchronization tool for vdir"
HOMEPAGE="https://github.com/untitaker/vdirsyncer"
SRC_URI="https://github.com/untitaker/vdirsyncer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DOCS=( AUTHORS.rst CHANGELOG.rst CONTRIBUTING.rst README.rst example.cfg )
