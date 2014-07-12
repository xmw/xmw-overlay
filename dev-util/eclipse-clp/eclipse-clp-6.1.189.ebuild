# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils readme.gentoo versionator

DESCRIPTION="OSS system for the cost-effective development and deployment of constraint programming applications"
HOMEPAGE="http://eclipseclp.org/"

MY_PV=$(replace_version_separator 2 _ ${PV})
SRC_URI="http://eclipseclp.org/Distribution/${MY_PV}/src/${PN/-clp}_src.tgz -> ${P}.tar.gz"

LICENSE="${pn} LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc +coin +gecode +glpk +gmp java mysql parallel tcl +threads"

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

REQUIRED_USE="coin? ( gmp ) glpk? ( coin ) parallel? ( tcl )"

pkg_setup() {
	use gecode && ewarn gecode does not work yet
	use doc && ewarn doc does not work yet
}

src_unpack() {
	default
	if use coin ; then
		local my_cbc=$(best_version sci-libs/coinor-cbc)
		cp "${EROOT}"usr/share/doc/${my_cbc/sci-libs\//}/examples/Cbc{Branch,Compare}User.{c,h}pp.* . || die
		unpack ./Cbc{Branch,Compare}User.{c,h}pp.*
		mv Cbc{Branch,Compare}User.{c,h}pp "${S}"/Eplex || die
	fi
}

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-mysql.patch \
		"${FILESDIR}"/${P}-tcl8.6.patch \
		"${FILESDIR}"/${P}-Eplex-Makefile.patch \
		"${FILESDIR}"/${P}-AR.patch \
		"${FILESDIR}"/${P}-Eplex-include.patch \
		"${FILESDIR}"/${P}-icparc_solvers.patch \
		"${FILESDIR}"/${P}-Oci-mkdir.patch \
		"${FILESDIR}"/${P}-Usc-64bit.patch \
		"${FILESDIR}"/${P}-Pds-64bit.patch \
		"${FILESDIR}"/${P}-Alog-64bit.patch \
		"${FILESDIR}"/${P}-weclipse.patch

	rm ARCH RUNME || die

	case "${ARCH}" in
		amd64) export ARCH=x86_64_linux ;;
		x86)   export ARCH=i386_linux   ;;
		*)     die "unsupported arch ${ARCH}" ;;
	esac
	export ECLIPSEDIR=${EROOT}opt/${PN}
	export MYSQLDIR="${EROOT}usr/include/mysql"
	export prefix="${S}/build"
	tc-export CC AR
	eautoreconf
}

src_configure() {
	#pushd Pds/src >/dev/null
	#ARCH=${PDS_ARCH} econf
	#popd >/dev/null

	local my_osi="--without-osi"
	if use coin ; then
		my_osi="--with-osi=symclp"
		#my_osi=" ... clpcbc" doesn't build jet
		if use glpk ; then
			my_osi="${my_osi} glpk"
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
	runme() {
		einfo "create wrapper $1"
		cat << EOF > "bin/${ARCH}/$1"
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
		chmod +x "bin/${ARCH}/$1"
	}
	mkdir -p "${S}/bin/${ARCH}"

	#replace toplevel Makefile.${ARCH}, -j1 bug etc.
	rm -fv Makefile.${ARCH} || die
	einfo "compile & install Shm"
	emake -C Shm/${ARCH} PREFIX="${S}" install

	einfo "compile & install Usc (Micro Second Clock)"
	pushd Usc
	./INSTALL || die
	popd

	einfo "compile & install Alog"
	pushd Alog
	./INSTALL || die
	popd

	einfo "compile & install Pds (Parallel Distributed System)"
	pushd Pds
	./INSTALL || die
	popd

	einfo "compile & install Kernel"
	emake -C Kernel/${ARCH} sepia
	emake -C Kernel/${ARCH} PREFIX="${S}" install
	runme "eclipse" "exec \"\${ECLIPSEDIR}/lib/x86_64_linux/eclipse.exe\" \"\$@\""

	if use parallel ; then
		einfo "compile & install parallel Kernel"
		emake -C Kernel/${ARCH} weclipse
		cp -v {Kernel,lib}/${ARCH}/weclipse
		runme "weclipse" "exec \"\${ECLIPSEDIR}/lib/x86_64_linux/weclipse\" \"\$@\""
		emake -C Kernel/${ARCH} peclipse
		cp -v {Kernel,lib}/${ARCH}/weclipse
		runme "peclipse" "exec \"\${ECLIPSEDIR}/lib/x86_64_linux/peclipse\" \"\$@\""
	fi

	if use tcl ; then
		runme "tkeclipse" "exec wish \"\${ECLIPSEDIR}/lib_tcl/tkeclipse.tcl\" -- \"\$@\""
		runme "tktools" "exec wish \"\${ECLIPSEDIR}/lib_tcl/tktools.tcl\" -- \"\$@\""
	fi

	#einfo "compile & install ecrc_solvers"
	#emake -C ecrc_solvers -f Makefile.${ARCH} PREFIX="${S}/build" install -j1

	einfo "compile & install Flexlm"
	emake -C Flexlm -f Makefile.${ARCH} PREFIX="${S}" install

	if use coin ; then
		einfo "compile & install Eplex"
		emake -C Eplex -f Makefile.${ARCH} PREFIX="${S}" install -j1

		einfo "compile & install icparc_solvers"
		emake -C icparc_solvers -f Makefile.${ARCH} PREFIX="${S}" install -j1
	fi
	if use gecode ; then
		einfo "compile & install GecodeInterface"
		emake -C GecodeInterface -f Makefile.${ARCH} PREFIX="${S}" install
	fi
	if use java ; then
		einfo "compile & install JavaInterface"
		emake -C JavaInterface -f Makefile.${ARCH} PREFIX="${S}" install
		runme "jeclipse" "exec \"\${JRE_HOME}/bin/java\" -Xss2m  -Declipse.directory=\"\${ECLIPSEDIR}\" -classpath \"\${ECLIPSEDIR}/lib/eclipse.jar\" com.parctechnologies.eclipse.JEclipse \"\$@\""

		einfo "compile & install Visualisation"
		emake -C Visualisation -f Makefile.${ARCH} PREFIX="${S}" install
	fi

	if use mysql ; then
		einfo "compile & install Oci"
		emake -C Oci -f Makefile.${ARCH} PREFIX="${S}" install -j1
	fi
}

src_install() {
	dodir /opt/${PN}
	mv bin doc include legal lib "${ED}opt/${PN}" || die
	make_wrapper eclipse "${EROOT}opt/${PN}/bin/${ARCH}/eclipse"

	if use tcl ; then
		mv lib_tcl "${ED}opt/${PN}" || die
		make_wrapper tkeclipse "${EROOT}opt/${PN}/bin/${ARCH}/tkeclipse"
		make_wrapper tktools "${EROOT}opt/${PN}/bin/${ARCH}/tktools"
	fi

	if use parallel ; then
		make_wrapper weclipse "${EROOT}opt/${PN}/bin/${ARCH}/weclipse"
		make_wrapper peclipse "${EROOT}opt/${PN}/bin/${ARCH}/peclipse"
	fi

	if use java ; then
		make_wrapper jeclipse "${EROOT}opt/${PN}/bin/${ARCH}/jeclipse"
	fi

	echo "ECLIPSEDIR=\"${EROOT}opt/${PN}\"" > "${T}"/90${PN}
	doenvd "${T}"/90${PN}

	dodoc README_UNIX
	readme.gentoo_create_doc
}