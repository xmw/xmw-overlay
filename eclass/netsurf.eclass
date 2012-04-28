# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: Michael Weber <xmw@gentoo.org>
# Purpose: 
#

inherit multilib

case "${EAPI:-0}" in
	3|4) EXPORTED_FUNCTIONS="src_prepare src_compile src_install" ;;
	*) die "EAPI=${EAPI} is not supported" ;;
esac

# exports must be ALWAYS after inherit
EXPORT_FUNCTIONS ${EXPORTED_FUNCTIONS}

HOMEPAGE="http://www.netsurf-browser.org/projects/"
SRC_URI="http://www.netsurf-browser.org/projects/releases/${P}-src.tar.gz"
LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND=""

DOCS=( )

# TODO doc
NETSURF_PC_FILE=${PN}.pc.in

netsurf_src_prepare() {
	sed -e "/^INSTALL_ITEMS/s: /lib: /$(get_libdir):g" \
		-e "s:-Werror::g" \
		-e "/^COMPONENT_TYPE/s:lib-static:lib-shared:" \
		-i Makefile || die
	if [ -e ${NETSURF_PC_FILE} ] ; then
		sed -e "/^libdir/s:/lib:/$(get_libdir):g" \
			-i ${NETSURF_PC_FILE} || die
	fi
}

netsurf_src_compile() {
	emake || die
	if has static-libs ${IUSE} && use static-libs ; then
		emake COMPONENT_TYPE=lib-static || die
	fi
	if has doc ${IUSE} && use doc ; then
		emake docs || die
	fi
}

netsurf_src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install || die
	if has static-libs ${IUSE} && use static-libs ; then
		emake COMPONENT_TYPE=lib-static DESTDIR="${D}" PREFIX=/usr install || die
	fi
	local x
	for x in ${DOCS[@]} ; do
		dodoc "${x}" || die
	done
	if has doc ${IUSE} && use doc ; then
		dohtml build/docs/html/* || die
	fi
}
