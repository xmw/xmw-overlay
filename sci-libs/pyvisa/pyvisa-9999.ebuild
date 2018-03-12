# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit git-r3 distutils-r1

DESCRIPTION="Python package with bindings to the Virtual Instrument Software Architecture VISA library"
HOMEPAGE="https://pyvisa.readthedocs.org"
EGIT_REPO_URI="https://github.com/pyvisa/pyvisa.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc"

RDEPEND=""
DEPEND="${RDEPEND}
	doc? ( dev-python/sphinx )"

src_compile() {
	distutils-r1_src_compile
	use doc && emake -C docs html
}

src_install() {
	distutils-r1_src_install
	if use doc ; then
		dodoc -r docs/_build/html
	fi
	dodoc examples/*
}
