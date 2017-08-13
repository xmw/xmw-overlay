# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="program to analyse a stereo audio signal"
HOMEPAGE="http://arvin.schnell-web.net/xanalyser/"
SRC_URI="http://arvin.schnell-web.net/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/alsa-lib
	x11-libs/openmotif"
DEPEND="${RDEPEND}"

