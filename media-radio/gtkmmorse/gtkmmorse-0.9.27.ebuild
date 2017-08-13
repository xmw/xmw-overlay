# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="morse code learning tool for Koch and clasic method"
HOMEPAGE="http://gtkmmorse.nongnu.org/"
SRC_URI="http://savannah.nongnu.org/download/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/libao
	dev-cpp/gconfmm"
DEPEND="${RDEPEND}"
