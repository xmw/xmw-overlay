# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit git-2 distutils-r1

DESCRIPTION="Python wrapper for librtlsdr (a driver for Realtek RTL2832U based SDR's)"
HOMEPAGE="https://github.com/roger-/pyrtlsdr"
EGIT_REPO_URI="git://github.com/roger-/pyrtlsdr.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-python/numpy
	net-wireless/rtl-sdr"
RDEPEND=""
