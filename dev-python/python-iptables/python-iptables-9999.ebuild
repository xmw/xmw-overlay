# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/python-iptables/python-iptables-0.4.0.ebuild,v 1.2 2014/08/10 21:19:05 slyfox Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )
inherit distutils-r1 git-r3

DESCRIPTION="Python bindings for iptables"
HOMEPAGE="https://github.com/ldx/python-iptables"
EGIT_REPO_URI="https://github.com/ldx/${PN}.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="net-firewall/iptables"
RDEPEND="${DEPEND}"

# tests manipulate live iptables rules, so disable them by default
RESTRICT=test
# needed for running tests
#RESTRICT=userpriv

PATCHES=(
	"${FILESDIR}/${P}-tests.patch"
)

python_test() {
	${PYTHON} test.py || die "tests fail with ${EPYTHON}"
}
