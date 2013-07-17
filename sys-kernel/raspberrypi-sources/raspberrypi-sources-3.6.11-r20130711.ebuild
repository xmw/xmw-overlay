# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

ETYPE=sources
K_DEFCONFIG="bcmrpi_cutdown_defconfig"
K_SECURITY_UNSUPPORTED=1
UNIPATCH_LIST="${DISTDIR}/${PF}.patch.xz"
CKV="3.6.11"
inherit kernel-2
detect_version
detect_arch

DESCRIPTION="Raspberry PI kernel sources"
HOMEPAGE="https://github.com/raspberrypi/linux"
# from github.com/rasperrypi/firmware/extra/git_hash
# MY_COMMIT="245f716a0b"
# https://github.com/raspberrypi/linux/tarball/${MY_COMMIT} ->
#		raspberrypi-sources-${MY_COMMIT}.tar.gz
SRC_URI="${KERNEL_URI}
	http://dev.gentoo.org/~xmw/${PN}/${PF}.patch.xz"

KEYWORDS="~arm"