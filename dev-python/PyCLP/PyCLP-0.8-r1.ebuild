# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_6 python3_3 python3_4 )
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
	export ECLIPSEDIR=${EROOT}opt/eclipse-clp
	export LD_RUN_PATH=${EROOT}opt/eclipse-clp/lib/x86_64_linux
}
