# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit linux-info linux-mod

DESCRIPTION="Intel driver for the e1000e chipset variants 82563/6/7, 82571/2/3/4/7/8/9, 82583 and I217/I218."
HOMEPAGE="https://downloadcenter.intel.com/Detail_Desc.aspx?agr=Y&DwnldID=15817&wapkw=e1000e"
SRC_URI="${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT=fetch

CONFIG_CHECK="~!E1000E"
ERROR_E1000E="CONFIG_E1000E has to be configured to Module to enable the replacement with this driver."

MODULE_NAMES="e1000e(misc:)"
BUILD_PARAMS="KSRC=\"${KERNEL_DIR}\""
BUILD_TARGETS="default"

S=${WORKDIR}/${P}/src

pkg_nofetch() {
	einfo "Please download \"${A}\" from"
	einfo "${HOMEPAGE}"
	einfo "and place it in ${DISTDIR},"
}
