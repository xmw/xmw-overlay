# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit java-utils-2

DESCRIPTION="graph drawing package that simplifies the inclusion of graph display and manipulation capabilities within Java applications and applets"
HOMEPAGE="http://www2.research.att.com/~john/Grappa/"
SRC_URI="http://www2.research.att.com/~john/${PN/g/G}/${PN}.tgz -> ${P}.tar.gz"

LICENSE="CPL-1.0"
SLOT="${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-java/javacup:0
	>=virtual/jdk-0"

S=${WORKDIR}

src_prepare() {
	rm -rf archives src/jdk1.0 src/jdk1.1 src/jdk1.2/java_cup || die
	epatch "${FILESDIR}"/${P}-Parser.cup.patch
	java-pkg_ensure-no-bundled-jars
}

src_compile() {
	cd src/jdk1.2/att/grappa
	java-pkg_jar-from --build-only javacup javacup.jar
	java-pkg_jar-from --build-only javacup javacup-runtime.jar

	#JDK=jdk1.2 ./mkParser || die
	einfo "generating Parser.java and Symbols.java from Parser.cup"
	"${JAVA_HOME}"/bin/java -jar javacup.jar -package att.grappa \
		-parser Parser -symbols Symbols -nonterms < Parser.cup || die
	sed -e "/^public/i$(sed -n '/^.[*]/s/$/\\/p' Parser.cup)" \
 		-i Parser.java || die

	#JDK=jdk1.2 ./mk || die
	einfo "${JAVAC} *.java"
	"${JAVAC}" -source 5 -target 5 -classpath javacup.jar:javacup-runtime.jar \
		-g -nowarn *.java || die

	einfo "generate grappa.jar"
	rm javacup.jar javacup-runtime.jar
	"${JAVA_HOME}"/bin/jar cf ../../../../${PN}.jar -C ../.. att
}

src_install() {
	java-pkg_dojar ${PN}.jar
}
