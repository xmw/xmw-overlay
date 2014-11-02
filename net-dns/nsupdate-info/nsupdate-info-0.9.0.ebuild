# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Dynamic DNS service"
HOMEPAGE="https://github.com/nsupdate-info/nsupdate.info"
SRC_URI="https://github.com/${PN}/${PN/-/.}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/django-1.7[sqlite]
	dev-python/django-bootstrap-form
	dev-python/django-debug-toolbar
	dev-python/django-extensions
	dev-python/django-registration
	dev-python/dnspython
	dev-python/netaddr
	dev-python/python-social-auth
	dev-python/south"
