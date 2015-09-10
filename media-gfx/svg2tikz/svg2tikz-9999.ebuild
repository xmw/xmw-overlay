# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1 git-r3

DESCRIPTION="Inkscape extension for exporting SVG paths as TikZ/PGF paths"
HOMEPAGE="https://github.com/kjellmf/svg2tikz"
EGIT_REPO_URI="https://github.com/kjellmf/${PN}.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
