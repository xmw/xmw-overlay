# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="high performance Minecraft map renderer written in C++"
HOMEPAGE="https://mapcrafter.org/"
EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="debug profile"

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}-libdir.patch )

src_configure() {
	local mycmakeargs=(
		-DLIB_INSTALL_DIR=$(get_libdir)
		-DOPT_OPTIMIZE=Off
		-DOPT_DEBUG=$(usex debug)
		-DOPT_PROFILE=$(usex profile)
	)

	cmake-utils_src_configure
}
