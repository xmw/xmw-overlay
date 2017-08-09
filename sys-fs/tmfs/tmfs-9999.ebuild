# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="Apple's Time Machine fuse read only file system"
HOMEPAGE="http://abique.github.com/tmfs"
EGIT_REPO_URI="https://github.com/abique/tmfs.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-libs/boost
	sys-fs/fuse:0"
DEPEND="${RDEPEND}
	dev-util/cmake"
