# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit linux-info

DESCRIPTION="trace exec() calls system-wide "
HOMEPAGE="https://github.com/chneukirchen/extrace"
SRC_URI="https://github.com/chneukirchen/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND=""

CONFIG_CHECK="~CONNECTOR ~PROC_EVENTS"

src_compile() {
	emake CFLAGS="${CFLAGS}"
}

src_install() {
	dosbin extrace pwait
}
