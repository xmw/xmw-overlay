# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils desktop flag-o-matic git-r3

DESCRIPTION="ground control station for drones"
HOMEPAGE="http://qgroundcontrol.io"
EGIT_REPO_URI="https://github.com/mavlink/${PN}.git"

LICENSE="Apache-2.0 GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-qt/qtbluetooth:5
	dev-qt/qtcharts:5
	dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtgraphicaleffects:5
	dev-qt/qtlocation:5
	dev-qt/qtmultimedia:5
	dev-qt/qtnetwork:5
	dev-qt/qtpositioning:5[qml]
	dev-qt/qtquickcontrols:5[widgets]
	dev-qt/qtspeech:5
	dev-qt/qtspeech:5
	dev-qt/qtsql:5
	dev-qt/qtsvg:5
	dev-qt/qttest:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5"
RDEPEND="${DEPEND}"

pkg_setup() {
	append-cxxflags \
		-Wno-error=int-in-bool-context \
		-Wno-error=ignored-attributes \
		-Wno-error=misleading-indentation \
		-Wno-error=implicit-fallthrough
}

src_prepare() {
	#bundled mavlink, eigen, maybe others
	default
	cmake-utils_src_prepare
	sed -e "/^Exec=/s:qgroundcontrol-start.sh:/usr/bin/${PN}:" \
		-i deploy/${PN}.desktop
}

src_install() {
	newbin "${BUILD_DIR}"/QGroundControl ${PN}
	doicon resources/icons/${PN}.png
	domenu deploy/${PN}.desktop
}
