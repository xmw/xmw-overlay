# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2 git-2

DESCRIPTION="Image Viewer and Organizer"
HOMEPAGE="https://gitorious.org/phototonic"
EGIT_REPO_URI="git://gitorious.org/phototonic/phototonic.git"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-qt/qtgui:4"
DEPEND="${RDEPEND}"
