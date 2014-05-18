# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils flag-o-matic readme.gentoo versionator

DESCRIPTION="OSS system for the cost-effective development and deployment of constraint programming applications"
HOMEPAGE="http://eclipseclp.org/"

MY_PV=$(replace_version_separator 2 _ ${PV})
SRC_URI="http://eclipseclp.org/Distribution/${MY_PV}/src/${PN/-cpl}_src.tgz -> ${P}.tar.gz"

LICENSE="${pn} LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc +coin +gecode +glpk +gmp +java +mysql +tcl +threads"

RDEPEND=""
DEPEND="${RDEPEND}
	gmp? ( dev-libs/gmp )
	doc? ( app-text/ghostscript-gpl
		dev-tex/hevea
		dev-texlive/texlive-latex )
	gecode? ( dev-libs/gecode )
	mysql? ( virtual/mysql )
	java? ( dev-java/batik dev-java/javahelp )
	coin? ( sci-libs/coinor-cbc[examples]
		sci-libs/coinor-osi[glpk?]
		sci-libs/coinor-symphony[glpk?]
		glpk? ( <sci-mathematics/glpk-4.54 ) )"

S=${WORKDIR}/Eclipse_${MY_PV}

REQUIRED_USE="coin? ( gmp ) glpk? ( coin )"

pkg_setup() {
	use gecode && ewarn gecode does not work yet
	use doc && ewarn doc does not work yet
}

src_unpack() {
	default
	local my_cbc=$(best_version sci-libs/coinor-cbc)
	cp "${EROOT}"usr/share/doc/${my_cbc/sci-libs\//}/examples/Cbc{Branch,Compare}User.{c,h}pp.* . || die
	unpack ./Cbc{Branch,Compare}User.{c,h}pp.*
	mv Cbc{Branch,Compare}User.{c,h}pp "${S}"/Eplex || die
}

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-mysql.patch \
		"${FILESDIR}"/${P}-tcl8.6.patch \
		"${FILESDIR}"/${P}-configure-osi.patch \
		"${FILESDIR}"/${P}-AR.patch \
		"${FILESDIR}"/${P}-Eplex-include.patch \
		"${FILESDIR}"/${P}-icparc_solvers.patch

	append-cflags -DUSE_INTERP_RESULT
	rm ARCH RUNME || die

	case "${ARCH}" in
		amd64) export ARCH=x86_64_linux ;;
		x86)   export ARCH=i386_linux ;;
		*)     die "unsupported arch ${ARCH}" ;;
	esac
	export ECLIPSEDIR=${EROOT}opt/${PN}
	export MYSQLDIR="${EROOT}usr/include/mysql"
	export prefix="${S}/build"
	eautoreconf
}

src_configure() {
	local my_osi="--without-osi"
	if use coin ; then
		if use glpk ; then
			my_osi="--with-osi=clpcbc symclp glpk"
		else
			my_osi="--with-osi=clpcbc symclp"
		fi
	fi
	econf \
		--without-cplex \
		--without-xpress \
		$(use_with gmp) \
		"${my_osi}" \
		--with-flexlm \
		$(use_with gecode gfd) \
		--without-graphviz \
		--without-gurobi \
		$(use_with mysql) \
		$(use_with java) \
		$(use_with java cpviz) \
		$(use_with threads pthreads) \
		$(use_with doc) \
		$(use_with tcl)
}

src_compile() {
	mkdir -p "${S}/build/bin/${ARCH}"

	#replace toplevel Makefile.${ARCH}, -j1 bug etc.
	rm -fv Makefile.${ARCH} || die
	einfo "compile & install Shm"
	emake -C Shm/${ARCH} PREFIX="${S}/build" install
	einfo "compile & install Kernel"
	emake -C Kernel/${ARCH} sepia
	emake -C Kernel/${ARCH} PREFIX="${S}/build" install
	einfo "install legal files"
	cp -pr legal "${S}/build" || die

	runme() {
		einfo "create wrapper $1"
		cat << EOF > "build/bin/${ARCH}/$1"
#!/bin/sh
export ECLIPSEDIR="\${ECLIPSEDIR:-${EROOT}opt/${PN}}"
if [ -z "\${LD_LIBRARY_PATH}" ] ; then
	export LD_LIBRARY_PATH="\${ECLIPSEDIR}/lib/${ARCH}"
else
	export LD_LIBRARY_PATH="\${ECLIPSEDIR}/lib/${ARCH}:\${LD_LIBRARY_PATH}"
fi
export JRE_HOME="\${JRE_HOME:-\${JAVA_HOME}}"
$2
EOF
		chmod +x "build/bin/${ARCH}/$1"
	}
	runme "eclipse" "exec \"\${ECLIPSEDIR}/lib/x86_64_linux/eclipse.exe\" \"\$@\""

	if use tcl ; then
		einfo "install lib_tcl"
		cp -pr lib_tcl "build" || die

		runme "tkeclipse" "exec wish \"\${ECLIPSEDIR}/lib_tcl/tkeclipse.tcl\" -- \"\$@\""
		runme "tktools" "exec wish \"\${ECLIPSEDIR}/lib_tcl/tktools.tcl\" -- \"\$@\""
	fi

	#einfo "compile & install ecrc_solvers"
	#emake -C ecrc_solvers -f Makefile.${ARCH} PREFIX="${S}/build" install -j1

	einfo "compile & install Flexlm"
	emake -C Flexlm -f Makefile.${ARCH} PREFIX="${S}/build" install

	if use coin ; then
		einfo "compile & install Eplex"
		emake -C Eplex -f Makefile.${ARCH} PREFIX="${S}/build" install -j1

		einfo "compile & install icparc_solvers"
		emake -C icparc_solvers -f Makefile.${ARCH} PREFIX="${S}/build" install -j1
	fi
	if use gecode ; then
		einfo "compile & install GecodeInterface"
		emake -C GecodeInterface -f Makefile.${ARCH} PREFIX="${S}/build" install
	fi
	if use java ; then
		einfo "compile & install JavaInterface"
		emake -C JavaInterface -f Makefile.${ARCH} PREFIX="${S}/build" install
		runme "jeclipse" "exec \"\${JRE_HOME}/bin/java\" -Xss2m  -Declipse.directory=\"\${ECLIPSEDIR}\" -classpath \"\${ECLIPSEDIR}/lib/eclipse.jar\" com.parctechnologies.eclipse.JEclipse \"\$@\""

		einfo "compile & install Visualisation"
		emake -C Visualisation -f Makefile.${ARCH} PREFIX="${S}/build" install
	fi

	if use mysql ; then
		einfo "compile & install Oci"
		emake -C Oci -f Makefile.${ARCH} PREFIX="${S}/build" install -j1
	fi
}

src_install() {
	dodir /opt
	mv "${S}/build" "${ED}opt/${PN}" || die

	local my_file
	make_wrapper eclipse "${EROOT}opt/${PN}/bin/${ARCH}/eclipse"
	if use tcl ; then
		make_wrapper tkeclipse "${EROOT}opt/${PN}/bin/${ARCH}/tkeclipse"
		make_wrapper tktools "${EROOT}opt/${PN}/bin/${ARCH}/tktools"
	fi
	if use java ; then
		make_wrapper jeclipse "${EROOT}opt/${PN}/bin/${ARCH}/jeclipse"
	fi

	echo "ECLIPSEDIR=\"${EROOT}opt/${PN}\"" > "${TMP}"/90${PN}
	doenvd "${TMP}"/90${PN}

	dodoc README_UNIX
	readme.gentoo_create_doc
}
