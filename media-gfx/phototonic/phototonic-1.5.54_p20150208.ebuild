# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qmake-utils vcs-snapshot

DESCRIPTION="Image Viewer and Organizer"
HOMEPAGE="https://gitorious.org/phototonic"
SRC_URI="https://gitorious.org/phototonic/phototonic/archive/06e2f123ac1f8f368dcb4db641c05d92f69f966b.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-qt/qtwidgets:5
	dev-qt/qtgui:5
	dev-qt/qtcore:5
	media-gfx/exiv2"
DEPEND="${RDEPEND}"

src_configure() {
	local project_file=$(qmake-utils_find_pro_file)
	eqmake5 "${project_file}"
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
