# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_6 python2_7 python3_2 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="extensible user-registration application for Django"
HOMEPAGE="https://github.com/macropin/django-registration http://django-registration-redux.readthedocs.org"
SRC_URI="https://github.com/macropin/${PN/-redux}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/django[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${P/-redux}
