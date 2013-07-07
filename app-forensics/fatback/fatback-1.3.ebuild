# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit base

DESCRIPTION="Tool to undelete files from FAT file systems"
HOMEPAGE="http://fatback.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=( AUTHORS ChangeLog NEWS )
PATCHES=( "${FILESDIR}"/${P}-include-retval.patch )
