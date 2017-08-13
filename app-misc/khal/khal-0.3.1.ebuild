# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="CLI calendar application"
HOMEPAGE="http://lostpackets.de/khal/"
SRC_URI="https://github.com/geier/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/tzlocal[${PYTHON_USEDEP}]
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/vdirsyncer[${PYTHON_USEDEP}]
	dev-python/urwid[${PYTHON_USEDEP}]
	dev-python/icalendar[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/requests-toolbelt[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]"
DEPEND=""

DOCS=( AUTHORS.txt CHANGELOG.rst CONTRIBUTING.txt README.rst khal.conf.sample )
#PATCHES=( "${FILESDIR}"/${P}-relative-imports.patch )
