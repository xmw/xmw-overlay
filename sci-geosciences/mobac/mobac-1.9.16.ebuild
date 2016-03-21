# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
EANT_BUILD_TARGET="build_mapsources shrink"

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="creates offline atlases for GPS handhelds and cell phone applications"
HOMEPAGE="http://mobac.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/Mobile%20Atlas%20Creator/Mobile%20Atlas%20Creator%20${PV}%20src.zip -> ${P}_src.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/jre:1.7"
DEPEND="${RDEPEND}"

S=${WORKDIR}

src_prepare() {
	sed -e '/userSettingsDir/s:programDir:userAppDataDir:' \
		-e '/atlasProfilesDir/s:currentDir:userAppDataDir:' \
		-e '/tileStoreDir/s:programDir:userAppDataDir:' \
		-i src/main/java/mobac/program/DirectoryManager.java || die

	# fix bundled libs
}

src_install() {
	java-pkg_dojar Mobile_Atlas_Creator.jar
	insinto ${JAVA_PKG_JARDEST}
	doins -r mapsources

	java-pkg_dolauncher ${PN} Mobile_Atlas_Creator.jar
	doicon misc/mobac.ico
	make_desktop_entry ${PN}

	dodoc CHANGELOG.txt README-DEV.HTM README.HTM
}
