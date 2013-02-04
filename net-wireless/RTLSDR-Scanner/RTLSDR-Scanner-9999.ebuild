# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit git-2 python-single-r1

DESCRIPTION="cross platform Python frequency scanning GUI for the OsmoSDR rtl-sdr library"
HOMEPAGE="http://eartoearoak.com/software/rtlsdr-scanner"
EGIT_REPO_URI="git://github.com/EarToEarOak/RTLSDR-Scanner.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-python/matplotlib
	net-wireless/gr-osmosdr
	net-wireless/pyrtlsdl"
DEPEND=""

src_prepare() {
	python_fix_shebang src/rtlsdr_scan.py
}

src_install() {
	dobin src/rtlsdr_scan.py
	dodoc readme.md
}
