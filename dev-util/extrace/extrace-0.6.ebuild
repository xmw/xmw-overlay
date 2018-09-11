# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit fcaps linux-info toolchain-funcs

DESCRIPTION="trace exec() calls system-wide "
HOMEPAGE="https://github.com/chneukirchen/extrace"
SRC_URI="https://github.com/chneukirchen/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

CONFIG_CHECK="~CONNECTOR ~PROC_EVENTS"

FILECAPS=( cap_net_admin+ep usr/sbin/extrace usr/sbin/pwait )

src_compile() {
	emake CFLAGS="${CFLAGS}" CC="$(tc-getCC)"
}

src_install() {
	dosbin extrace pwait
	doman extrace.1 pwait.1
}
