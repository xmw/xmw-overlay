# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils java-utils-2 readme.gentoo versionator

DESCRIPTION="OSS system for the cost-effective development and deployment of constraint programming applications"
HOMEPAGE="http://eclipseclp.org/"

MY_PV=$(replace_version_separator 2 _ ${PV})
SRC_URI="http://eclipseclp.org/Distribution/${MY_PV}/src/${PN/-clp}_src.tgz -> ${P}.tar.gz"

LICENSE="${pn} LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc +coin +gecode +glpk +gmp java mysql parallel tcl +threads"

#Braucht gmp 4.2 4.1, vmtl dev-libs/gmp:3
#[doc] brauch wohl hevea: dev-tex/hevea
RDEPEND=""
DEPEND="${RDEPEND}
	gmp? ( dev-libs/gmp:3 )
	doc? ( app-text/ghostscript-gpl
		dev-tex/hevea
		dev-texlive/texlive-latex )
	gecode? ( dev-libs/gecode )
	mysql? ( virtual/mysql )
	java? ( dev-java/batik:1.7
		dev-java/grappa:1.2
		dev-java/javacup:0
		dev-java/javahelp:0
		dev-java/xml-commons-external:1.4
	)
	coin? ( sci-libs/coinor-cbc[examples]
		sci-libs/coinor-osi[glpk?]
		sci-libs/coinor-symphony[glpk?]
		glpk? ( <sci-mathematics/glpk-4.54 ) )"

S=${WORKDIR}/Eclipse_${MY_PV}

REQUIRED_USE="coin? ( gmp ) glpk? ( coin ) parallel? ( tcl )"

src_prepare() {
	epatch \
		"${FILESDIR}"/${PN}-6.1.194-mysql.patch \
		"${FILESDIR}"/${PN}-6.1.194-tcl8.6.patch \
		"${FILESDIR}"/${PN}-6.1.194-Eplex-Makefile.patch \
		"${FILESDIR}"/${PN}-6.1.194-AR.patch \
		"${FILESDIR}"/${PN}-6.1.194-Eplex-include.patch \
		"${FILESDIR}"/${PN}-6.1.194-icparc_solvers.patch \
		"${FILESDIR}"/${PN}-6.1.194-Oci-mkdir.patch \
		"${FILESDIR}"/${PN}-6.1.194-Usc-64bit.patch \
		"${FILESDIR}"/${PN}-6.1.194-Pds-64bit.patch \
		"${FILESDIR}"/${PN}-6.1.194-Alog-64bit.patch \
		"${FILESDIR}"/${PN}-6.1.194-weclipse.patch \
		"${FILESDIR}"/${PN}-6.1.194-Shm-buildsystem.patch \
		"${FILESDIR}"/${PN}-6.1.204-Visualisation-buildsystem.patch \
		"${FILESDIR}"/${PN}-6.1.204-grappa-detect.patch \
		"${FILESDIR}"/${PN}-6.1.204-cp-viz-detect.patch \
		"${FILESDIR}"/${PN}-6.1.204-JavaInterface-string.patch

	rm ARCH RUNME || die

	case "${ARCH}" in
		amd64) export ARCH=x86_64_linux ;;
		x86)   export ARCH=i386_linux   ;;
		*)     die "unsupported arch ${ARCH}" ;;
	esac
	export ECLIPSEDIR=${EROOT}opt/${PN}
	if use mysql ; then
		export MYSQLDIR="${EROOT}usr/include/mysql"
	fi
	if use java ; then
		export GRAPPA_DIR="${EROOT}usr/share/grappa-1.2/lib"
		export GRAPPA_JAR="grappa.jar"
		export BATIK_DIR="${EROOT}usr/share/batik-1.7"
		export JHELP_DIR="${EROOT}usr/share/javahelp"
		export JAVACUP_DIR="${EROOT}usr/share/javacup/lib"
		export JAVACUP_JAR="javacup-runtime.jar"
	fi
	tc-export CC AR
	eautoreconf

	pushd Shm/src >/dev/null
	eautoreconf
	popd >/dev/null
}

src_configure() {
	my_submods="Shm Usc Alog Pds"
	local my_submod
	for my_submod in ${my_submods}; do
		einfo "configure ${my_submod}"
		pushd ${my_submod}/src >/dev/null || die
		econf
		popd >/dev/null || die
	done

	econf \
		--without-cplex \
		--without-xpress \
		$(use_with gmp) \
		$(usex coin "--with-osi=symclp$(usex glpk " glpk" "")" "--without-osi") \
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
	#replace toplevel Makefile.${ARCH}, -j1 bug etc.
	rm -fv Makefile.${ARCH} || die
	mkdir -p sys_{include,{bin,lib}/${ARCH}} || die

	local my_out
	local my_submod
	for my_submod in ${my_submods}; do
		einfo "compile and install ${my_submod}"
		mkdir -p $my_submod/{include,{bin,lib}/${ARCH}} || die
		case $my_submod in
			Pds)	emake -C ${my_submod}/src install_all ;;
			*)		emake -C ${my_submod}/src install ;;
		esac
		for my_out in $(find ${my_submod}/{include,{bin,lib}/${ARCH}} -type f) ; do
			mv -vn ${my_out} sys_${my_out/${my_submod}\/} || die
		done
	done
	runme() {
		einfo "create wrapper $1"
		local my_dest="${S}/build/bin/${ARCH}/$1"
		mkdir -p "$(dirname "${my_dest}")" || die
		cat << EOF > "${my_dest}"
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
		chmod +x "${my_dest}" || die
	}
	mkdir -p "${S}/bin/${ARCH}"
	einfo "compile installation kernel (sepia)"
	emake -C Kernel/${ARCH} sepia
	einfo "compile runtime kernel (eclipse.exe)"
	emake -C Kernel/${ARCH} eclipse.exe
	einfo "install kernel and header files"
	emake -C Kernel/${ARCH} PREFIX="${S}/build" install
	runme "eclipse" "exec \"\${ECLIPSEDIR}/lib/${ARCH}/eclipse.exe\" \"\$@\""
	if use parallel ; then
		einfo "compile & install parallel Kernel"
		emake -C Kernel/${ARCH} weclipse
		cp -v Kernel/${ARCH}/weclipse "${S}/build/bin" || die
		runme "weclipse" "exec \"\${ECLIPSEDIR}/lib/${ARCH}/weclipse\" \"\$@\""
		emake -C Kernel/${ARCH} peclipse
		cp -v Kernel/${ARCH}/peclipse "${S}/build/bin" || die
		runme "peclipse" "exec \"\${ECLIPSEDIR}/lib/${ARCH}/peclipse\" \"\$@\""
	fi
	if use tcl ; then
		runme "tkeclipse" "exec wish \"\${ECLIPSEDIR}/lib_tcl/tkeclipse.tcl\" -- \"\$@\""
		runme "tktools" "exec wish \"\${ECLIPSEDIR}/lib_tcl/tktools.tcl\" -- \"\$@\""
	fi
	eemake() {
		emake -f Makefile.${ARCH} PREFIX="${S}/build" ECLIPSEDIR="${S}/build" -j1 "$@"
	}
	einfo "compile & install ecrc_solvers"
	eemake -C ecrc_solvers install \
		AUX_ECLIPSE="${S}/build/bin/${ARCH}/eclipse"
	einfo "compile & install Flexlm"
	eemake -C Flexlm install
	einfo "compile & install Contrib"
	eemake -C Contrib install
	if use coin ; then
		einfo "compile & install Eplex"
		eemake -C Eplex install
		einfo "compile & install icparc_solvers"
		eemake -C icparc_solvers install
	fi
	if use gecode ; then
		einfo "compile & install GecodeInterface"
		eemake -C GecodeInterface install
	fi
	if use java ; then
		einfo "compile & install JavaInterface"
		eemake -C JavaInterface install \
			AUX_ECLIPSE="${S}/build/bin/${ARCH}/eclipse"
		runme "jeclipse" "exec \"\${JRE_HOME}/bin/java\" -Xss2m  -Declipse.directory=\"\${ECLIPSEDIR}\" -classpath \"\${ECLIPSEDIR}/lib/eclipse.jar\" com.parctechnologies.eclipse.JEclipse \"\$@\""
		einfo "compile & install Visualisation"
		java-pkg_jar-from --build-only javacup javacup-runtime.jar
		eemake -C Visualisation all_visualisation
		einfo "compile & install CPViz"
		mkdir -p CPViz/jars/batik CPViz/jars/jhelp || die
		cd "${S}"/CPViz/jars/batik || die
		java-pkg_jar-from --build-only batik-1.7
		java-pkg_jar-from --build-only xml-commons-external-1.4
		cd "${S}"/CPViz/jars/jhelp || die
		java-pkg_jar-from --build-only javahelp
		cd "${S}" || die
		eemake -C CPViz all_cpviz
	fi
	if use mysql ; then
		einfo "compile & install Oci"
		eemake -C Oci install \
			ECLIPSE="${S}/build/bin/${ARCH}/eclipse"
	fi
}

src_install() {
	mkdir "${ED}"opt || die
	mv build "${ED}opt/${PN}" || die
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
