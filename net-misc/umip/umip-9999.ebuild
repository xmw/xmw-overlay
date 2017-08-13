# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools git-2 linux-info

DESCRIPTION="Implementation of Mobile IPv6 and NEMO Basic Support."
HOMEPAGE="http://umip.org"
EGIT_REPO_URI="git://git.${PN}.org/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+vt"

COMMON_DEPEND="dev-libs/openssl"
DEPEND="${COMMON_DEPEND}
	dev-util/indent
	sys-kernel/linux-headers"
RDEPEND="${COMMON_DEPEND}
	net-misc/radvd
	net-firewall/ipsec-tools[ipv6]"

CONFIG_CHECK="~IPV6_MIP6 ~INET6_XFRM_MODE_ROUTEOPTIMIZATION ~IPV6_TUNNEL ~IPV6_MULTIPLE_TABLES IPV6_SUBTREES ~NET_KEY_MIGRATE ~XFRM_SUB_POLICY"

pkg_setup() {
	linux-info_pkg_setup

	if kernel_is lt 3 8 1 ; then
		ewarn "Your kernel version lacks support for required features."
		ewarn "Upgrade your kernel to a version >= 3.8.1 or apply the patches found at"
		ewarn "http://umip.org/docs/patches/"
	fi
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.0-force-bundled-netlink.patch

	eautoreconf
}

src_configure() {
	econf \
		--enable-debug \
		$(use_enable vt) \
		--without-builtin-crypto
}

src_install() {
	default

	dodoc extras/*.conf
	newinitd "${FILESDIR}"/mip6d.init mip6d
	newconfd "${FILESDIR}"/mip6d.conf mip6d
}
