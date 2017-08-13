# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit linux-info linux-mod eutils

DESCRIPTION="kernel module fix for the MSP430 LaunchPad UART"
HOMEPAGE="https://aur.archlinux.org/packages.php?ID=63769"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

CONFIG_CHECK="~!USB_SERIAL_TI"
ERROR_X86_ACPI_CPUFREQ="CONFIG_USB_SERIAL_TI has to be configured to Module to enable the replacement of cdc-acm with msp430-uart."
MODULE_NAMES="${PN}(misc:)"
BUILD_TARGETS="module"

DEPEND=""
RDEPEND=""

S=${WORKDIR}

src_unpack() {
	default
	cp -v "${KERNEL_DIR}"/drivers/usb/class/cdc-acm.{c,h} . || die
}

src_prepare() {
	if kernel_is ge 3 14 10 ; then
		epatch "${FILESDIR}"/${P}-cdc-acm-3.4.10.patch
	else
		epatch "${FILESDIR}"/${P}-cdc-acm.patch
	fi
	echo "obj-m := ${PN}.o" >> Makefile
	echo "module:" >> Makefile
	echo "	\$(MAKE) -C "${KERNEL_DIR}" M="${S}" modules" >> Makefile
	mv cdc-acm.c ${PN}.c || die
	export KERNEL_DIR="${KERNEL_DIR}"
}
