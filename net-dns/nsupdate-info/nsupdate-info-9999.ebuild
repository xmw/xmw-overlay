# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1 git-r3

DESCRIPTION="Dynamic DNS service"
HOMEPAGE="https://github.com/nsupdate-info/nsupdate.info"
EGIT_REPO_URI="https://github.com/nsupdate-info/nsupdate.info.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/django-1.7[sqlite,$PYTHON_USEDEP]
	<dev-python/django-1.8[sqlite,$PYTHON_USEDEP]
	dev-python/django-bootstrap-form[$PYTHON_USEDEP]
	dev-python/django-debug-toolbar[$PYTHON_USEDEP]
	dev-python/django-extensions[$PYTHON_USEDEP]
	dev-python/django-registration-redux[$PYTHON_USEDEP]
	dev-python/dnspython[$PYTHON_USEDEP]
	dev-python/netaddr[$PYTHON_USEDEP]
	dev-python/python-social-auth[$PYTHON_USEDEP]
	dev-python/requests[$PYTHON_USEDEP]
"
