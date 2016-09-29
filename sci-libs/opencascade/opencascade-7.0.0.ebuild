# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils eutils check-reqs multilib java-pkg-opt-2 flag-o-matic

DESCRIPTION="Software development platform for CAD/CAE, 3D surface/solid modeling and data exchange"
HOMEPAGE="http://www.opencascade.com/"
SRC_URI="http://www.${PN}.com/sites/default/files/private/occt/OCC_${PV}_release/${P}.tgz"

LICENSE="|| ( Open-CASCADE-LGPL-2.1-Exception-1.0 LGPL-2.1 )"
SLOT="${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc examples freeimage gl2ps java tbb test vtk"

MY_VTK="vtk-6.1"
DEPEND="app-eselect/eselect-opencascade
	dev-lang/tcl:0=
	dev-lang/tk:0=
	dev-tcltk/itcl
	dev-tcltk/itk
	dev-tcltk/tix
	media-libs/freetype:2
	media-libs/ftgl
	virtual/glu
	virtual/opengl
	x11-libs/libXmu
	doc? ( app-doc/doxygen )
	freeimage? ( media-libs/freeimage )
	gl2ps? ( x11-libs/gl2ps )
	java? ( >=virtual/jdk-0:= )
	tbb? ( dev-cpp/tbb )
	vtk? ( =sci-libs/${MY_VTK}*[rendering] )"
RDEPEND="${DEPEND}"

# https://bugs.gentoo.org/show_bug.cgi?id=352435
# https://www.gentoo.org/foundation/en/minutes/2011/20110220_trustees.meeting_log.txt
RESTRICT="bindist fetch mirror"

CHECKREQS_MEMORY="256M"
CHECKREQS_DISK_BUILD="3584M"

PATCHES=( "${FILESDIR}"/${P}-buildsystem.patch 
	"${FILESDIR}"/${P}-MAT2d.patch )

pkg_setup() {
	check-reqs_pkg_setup
	java-pkg-opt-2_pkg_setup
}

src_prepare() {
	cmake-utils_src_prepare
	java-pkg-opt-2_src_prepare
}

src_configure() {
	# from dox/dev_guides/building/cmake/cmake.md
	local mycmakeargs=(
		-DBUILD_WITH_DEBUG=$(usex debug)
		-DINSTALL_DIR="${EROOT}"usr
		-DINSTALL_DIR_WITH_VERSION=yes
		-DUSE_D3D=no
		-DUSE_FREEIMAGE=$(usex freeimage)
		-DUSE_GL2PS=$(usex gl2ps)
		-DUSE_TBB=$(usex tbb)
		-DUSE_VTK=$(usex vtk)
		-DBUILD_DOC_Overview=$(usex doc)
		-DINSTALL_DOC_Overview=$(usex doc)
		-DINSTALL_SAMPLES=$(usex examples)
		-DINSTALL_TEST_CASES=$(usex test)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	#insinto /etc/env.d/${PN}
	#newins 50${PN} ${PV}

	rm -v "${D}"usr/share/doc/${P}/README.txt* \
		"${D}"usr/share/doc/${P}/LICENSE_LGPL_21.txt* \
		"${D}"usr/share/doc/${P}/OCCT_LGPL_EXCEPTION.txt* || die

	if ! use examples; then
		rm -rf "${D}"usr/share/${P}/samples || die
	fi

	if use doc; then
		insinto /usr/share/doc/${PF}
		doins -r doc/{overview,pdf,refman}
		doins doc/release_notes_${PV}.pdf
	fi
}

pkg_postinst() {
	eselect ${PN} set ${PV}
	einfo
	elog "After upgrading OpenCASCADE you may have to rebuild packages depending on it."
	elog "You get a list by running \"equery depends sci-libs/opencascade\""
	elog "revdep-rebuild does NOT suffice."
	einfo
}
