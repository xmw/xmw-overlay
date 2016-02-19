# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib vcs-snapshot

DESCRIPTION="Raspberry Pi userspace tools and libraries"
HOMEPAGE="https://github.com/raspberrypi/firmware"
MY_COMMIT="6cc27e02dd"
SRC_URI="https://github.com/raspberrypi/firmware/tarball/${MY_COMMIT} ->
	raspberrypi-firmware-${MY_COMMIT}.tar.gz"

LICENSE="BSD GPL-2 raspberrypi-videocore-bin"
SLOT="0"
KEYWORDS="~arm -*"
IUSE="+hardfp examples"

RDEPEND="!media-libs/raspberrypi-userland"
DEPEND="${DEPEND}"

S=${WORKDIR}/raspberrypi-firmware-${MY_COMMIT}

RESTRICT="binchecks"

src_prepare() {
	cd $(usex hardfp hardfp/ "")opt/vc || die

	sed -e '/#include/s:"vcos_platform:"interface/vcos/pthreads/vcos_platform:' \
		-i.orig include/interface/vcos/*.h || die
	sed -e '/#include/s:"vchost_config:"interface/vmcs_host/linux/vchost_config:' \
		-i include/interface/vmcs_host/*.h || die
	#	-e '/#include/s:"vchost_config:"interface/vmcs_host/vchost_config:' \
	#	-e '/#include/s:"vcfilesys_def:"interface/vmcs_host/vcfilesys_def:' \
}

src_install() {
	cd $(usex hardfp hardfp/ "")opt/vc || die

	insinto /usr/include
	doins -r include/*
	insopts -m 0755
	insinto /usr/bin
	doins bin/*
	insinto /usr/sbin
	doins sbin/*
	insinto "/usr/$(get_libdir)"
	doins -r lib/*

	insopts -m 0644
	insinto /usr/share/doc/${PF}/examples
	use examples && doins -r src/hello_pi
}
