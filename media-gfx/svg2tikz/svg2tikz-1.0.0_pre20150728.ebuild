# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Inkscape extension for exporting SVG paths as TikZ/PGF paths"
HOMEPAGE="https://github.com/kjellmf/svg2tikz"
SRC_URI="https://github.com/kjellmf/svg2tikz/archive/d138c81.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
