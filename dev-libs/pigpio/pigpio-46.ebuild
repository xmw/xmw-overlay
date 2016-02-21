# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 python3_4 python3_5 )
DISTUTILS_OPTIONAL=1
inherit eutils toolchain-funcs distutils-r1 vcs-snapshot

DESCRIPTION="C library for the Raspberry allowing control of general purpose input outputs"
HOMEPAGE="http://abyz.co.uk/rpi/pigpio https://github.com/joan2937/pigpio"
SRC_URI="https://github.com/joan2937/pigpio/tarball/89fca375878da804ac24dc8e78f42ee2ec00fc9b -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="examples python remote"

RDEPEND="python? ( ${PYTHON_DEPS} )"
DEPEND="${RDEPEND}"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-44-format-security.patch \
		"${FILESDIR}"/${PN}-44-Makefile.patch \
		"${FILESDIR}"/${PN}-44-MakeRemote.patch

	tc-export CC AR RANLIB
	export SIZE="$(tc-getAR)"
	export SIZE="${SIZE/-ar/-size}"
	export SHLIB="$(tc-getCC) -shared"
	export STRIPLIB="true"

	use python && distutils-r1_src_prepare
}

src_configure() {
	use python && distutils-r1_src_configure
}

src_compile() {
	if use remote ; then
		emake -f MakeRemote libpigpiod_if.so
		emake -f MakeRemote libpigpiod_if2.so
		emake -f MakeRemote
	else
		emake
	fi

	use python && distutils-r1_src_compile
}

src_install() {
	if use remote ; then
		emake -f MakeRemote install prefix="${EROOT}"usr DESTDIR="${D}"
	else
		emake install prefix="${EROOT}"usr DESTDIR="${D}"
	fi

	use python && distutils-r1_src_install

	if use examples ; then
		dodoc -r EXAMPLES
	fi
}
