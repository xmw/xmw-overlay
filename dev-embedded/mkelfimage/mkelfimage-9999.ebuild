# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

ESVN_REPO_URI="svn://coreboot.org/coreboot/trunk/util/mkelfImage"

inherit subversion

DESCRIPTION="utility to create ELF boot images from Linux kernel images"
HOMEPAGE="http://www.coreboot.org/Mkelfimage"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

