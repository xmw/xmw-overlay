# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils flag-o-matic toolchain-funcs versionator

DESCRIPTION="OSS system for the cost-effective development and deployment of constraint programming applications"
HOMEPAGE="http://eclipseclp.org/"

MY_PV=$(replace_version_separator 2 _ ${PV})
SRC_URI="http://eclipseclp.org/Distribution/${MY_PV}/src/${PN/-cpl}_src.tgz -> ${P}.tar.gz"

LICENSE="${pn} LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc tcl threads"

RDEPEND=""
DEPEND="doc? (
	app-text/ghostscript-gpl
	dev-tex/hevea
	dev-texlive/texlive-latex
	) "

S="${WORKDIR}/Eclipse_${MY_PV}"

src_prepare() {
	append-cflags -DUSE_INTERP_RESULT -fPIC
	tc-export AR

	epatch \
		"${FILESDIR}"/${P}-automagic-doc.patch \
		"${FILESDIR}"/${P}-includedir.patch \
		"${FILESDIR}"/${P}-shm-respect-ar.patch

	eautoreconf

	#replace arch guessing script
	rm ARCH || die
	case "${ARCH}" in
		amd64) export ARCH=x86_64_linux ;;
		x86)   export ARCH=i386_linux ;;
		*)     die "unsupported arch ${ARCH}" ;;
	esac
	mkdir build
	echo -e '#!/bin/sh\necho $ARCH' > build/ARCH
	chmod +x build/ARCH
}

src_configure() {
	econf \
		--with-gmp
		--without-cplex \
		--without-cpviz \
		--without-flexlm \
		--without-gfd \
		--without-graphviz \
		--without-gurobi \
		--without-mysql \
		--without-osi \
		--without-xpress \
		$(use_with threads pthreads) \
		$(use_with doc) \
		$(use_with tcl)
}

src_compile() {
	emake -f Makefile.${ARCH} PREFIX="${S}/build"
}

src_install() {
	local my_file
	for my_file in "build/bin/${ARCH}/"* ; do
		sed -e "s:${S}/build:${EROOT}opt/${PN}:g" \
			-i "${my_file}" || die
	done

	rmdir build/tcltk{/x86_64_linux,}
	use doc || rm -rf build/doc
	dodir /opt
	mv build "${ED}"opt/${PN}

	for my_file in "${EROOT}opt/${PN}/bin/${ARCH}/"* ; do
		make_wrapper "$(basename "${my_file}")" "${my_file}"
	done
}
