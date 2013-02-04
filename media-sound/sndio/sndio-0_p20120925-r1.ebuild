# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils toolchain-funcs user

DESCRIPTION="small audio and MIDI framework part of the OpenBSD project"
HOMEPAGE="http://www.sndio.org/"
SRC_URI="http://xmw.de/mirror/${PN}/${P}.tar.bz2"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa"

RDEPEND="alsa? ( media-libs/alsa-lib )"
DEPEND="${REPEND}"

pkg_setup() {
	if ! use alsa ; then
		ewarn "alsa output disabled, no local output"
	fi
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0_p20120925-configure.patch
	epatch "${FILESDIR}"/${PN}-0_p20120925-username.patch
	epatch "${FILESDIR}"/${PN}-0_p20120925-syntax.patch
}

src_configure() {
	econf \
		$(use_enable alsa) \
		--disable-sun || die
	tc-export CC
}

src_install() {
	default
	dodir /var/lib/sndio
	newinitd "${FILESDIR}"/initd ${PN}d
	newconfd "${FILESDIR}"/confd ${PN}d
}

pkg_postinst() {
	enewuser ${PN}d -1 -1 /var/lib/${PN} audio
}
