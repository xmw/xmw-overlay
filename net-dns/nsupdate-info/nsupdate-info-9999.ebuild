# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

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
	>=dev-python/django-1.7[sqlite]
	dev-python/django-debug-toolbar
	dev-python/django-extensions
	dev-python/django-registration
	dev-python/django-bootstrap-form
	dev-python/python-social-auth
	dev-python/dnspython
	dev-python/netaddr"
