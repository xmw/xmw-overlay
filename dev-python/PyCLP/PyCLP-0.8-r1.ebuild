# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} )
inherit distutils-r1

DESCRIPTION="Python library to interface ECLiPSe Constraint Programmig System"
HOMEPAGE="https://sourceforge.net/projects/pyclp/"
SRC_URI="mirror://pypi/P/PyCLP/PyCLP-0.8.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-util/eclipse-clp"
DEPEND="${RDEPEND}"

pkg_setup() {
	export ECLIPSEDIR=${EROOT}opt/eclipse-cpl
	export LD_RUN_PATH=${EROOT}opt/eclipse-cpl/lib/x86_64_linux
}
