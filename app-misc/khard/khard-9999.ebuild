# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit git-r3 distutils-r1

DESCRIPTION="console carddav client"
HOMEPAGE="https://github.com/scheibler/khard/"
EGIT_REPO_URI="https://github.com/scheibler/khard.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="dev-python/vobject[${PYTHON_USEDEP}]
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-misc/vdirsyncer[${PYTHON_USEDEP}]"

DOCS=( AUTHORS CHANGES README.md khard.conf.example )
PATCHES=( "${FILESDIR}"/${P}-no-argparse.patch )
