# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils mercurial

DESCRIPTION="simple C++ wrapper around libusb providing some additional convenience functions"
HOMEPAGE="https://bitbucket.org/stativ/libusbpp"
EHG_REPO_URI="https://bitbucket.org/stativ/libusbpp"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="examples"

RDEPEND="virtual/libusb:1"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( )

src_prepare() {
	if ! $(use examples) ; then
		comment_add_subdirectory examples
	fi
}
