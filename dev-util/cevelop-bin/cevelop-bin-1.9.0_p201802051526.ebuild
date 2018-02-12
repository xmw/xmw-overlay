# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit desktop eutils versionator xdg

DESCRIPTION="C++ IDE for professional developers"
HOMEPAGE="https://cevelop.com"
SRC_URI="amd64? ( https://cevelop.com/${PN/-bin}/downloads/${PN/-bin}-${PV/_p/-}-linux.gtk.x86_64.tar.gz )
	x86? ( https://cevelop.com/${PN/-bin}/downloads/${PN/-bin}-${PV/_p/-}-linux.gtk.x86.tar.gz )"

LICENSE="${PN}"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/jre"
DEPEND=""

S=${WORKDIR}/${PN/-bin}-$(get_version_component_range 1-3)

src_prepare() {
	default

	sed -e "/Icon/s/icon/${PN/-bin}/" \
		-i ${PN/-bin}.desktop
}

src_install() {
	insinto /opt/${PN}
	doins artifacts.xml cevelop.ini .eclipseproduct
	doins -r configuration features p2 plugins
	insopts -m 0755
	doins runner

	make_wrapper ${PN} /opt/${PN}/runner

	sed -e '2iexport CEVELOP_INTRO=false' \
		-e '2i#export SWT_GTK3=0' \
		-i "${D}"/usr/bin/${PN} || die

	dodoc notice.html readme/*

	make_desktop_entry ${PN}
	newicon icon.xpm ${PN}.xpm
}
