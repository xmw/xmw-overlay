# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cvs eutils toolchain-funcs user

DESCRIPTION="small audio and MIDI framework part of the OpenBSD project"
HOMEPAGE="http://www.sndio.org/"
ECVS_SERVER="moule.caoua.org:/sndio"
ECVS_MODULE="${PN}"
ECVS_AUTH="ext"
ECVS_USER="anoncvs"
#ECVS_SSH_HOST_KEY="moule.caoua.org,2001:7a8:4e69::1 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMGPWNw+u/o4raby5ZszCAUC2b4BCwfvGzm81s5mRHqDRt1ksrde6uaB79mzzM3dm/rp3rjYFx38cVeGjQDxVgs="

LICENSE="ISC"
SLOT="0"
KEYWORD=""
IUSE="alsa"

RDEPEND="alsa? ( media-libs/alsa-lib )"
DEPEND="${REPEND}"

S=${WORKDIR}/${PN}

RESTRICT="test"

pkg_setup() {
	if ! use alsa ; then
		ewarn "alsa output disabled, no local output"
	fi
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0_p20120925-configure.patch
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
