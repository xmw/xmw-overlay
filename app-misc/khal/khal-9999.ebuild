# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
#PYTHON_COMPAT=( python2_7 python3_3 python3_4 )
PYTHON_COMPAT=( python2_7 )

inherit git-r3 distutils-r1

DESCRIPTION="CLI calendar application"
HOMEPAGE="http://lostpackets.de/khal/"
EGIT_REPO_URI="https://github.com/geier/${PN}.git"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS=""
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
PATCHES=( "${FILESDIR}"/${P}-relative-imports.patch )
