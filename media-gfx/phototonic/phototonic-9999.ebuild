# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit qmake-utils git-2

DESCRIPTION="Image Viewer and Organizer"
HOMEPAGE="https://gitorious.org/phototonic"
EGIT_REPO_URI="git://gitorious.org/phototonic/phototonic.git"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS=""
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
