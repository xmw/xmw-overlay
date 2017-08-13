# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
VALA_MIN_API_VERSION=0.16

inherit bzr cmake-utils eutils fdo-mime gnome2-utils vala

DESCRIPTION="Twitter client for elementary OS"
HOMEPAGE="http://www.ivonunes.net/birdie"
EBZR_REPO_URI="lp:birdie"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="granite"

RDEPEND="dev-db/sqlite:3
	dev-libs/glib:2
	dev-libs/json-glib
	dev-libs/libdbusmenu:3[introspection]
	dev-libs/libgee:0
	media-libs/libcanberra
	net-im/pidgin
	net-libs/rest:0.7
	net-libs/webkit-gtk:3
	x11-libs/gtk+:3[introspection]
	x11-libs/libXtst
	x11-libs/libnotify
	x11-libs/libwnck:3
	>=x11-themes/gnome-themes-standard-3.6.5
	granite? ( >=dev-libs/granite-0.2.1 )"
DEPEND="${RDEPEND}
	$(vala_depend)
	virtual/pkgconfig"

src_prepare() {
	vala_src_prepare
	cmake-utils_src_prepare
	epatch \
		"${FILESDIR}/${P}-no-icon-cache-update.patch" \
		"${FILESDIR}/${P}-no-desktop-database-update.patch" \
		"${FILESDIR}/${P}-schemas.patch"
}

src_configure() {
	local mycmakeargs=(
		-DVALA_EXECUTABLE="${VALAC}"
		-DGSETTINGS_COMPILE=OFF
	)
	cmake-utils_src_configure
}

pkg_preinst() {
	gnome2_icon_savelist
	gnome2_schemas_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
	gnome2_schemas_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
	gnome2_schemas_update
}
