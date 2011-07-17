# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Direct Connect peer-to-peer filesharing network client"
HOMEPAGE="http://www.dolda2000.com/~fredrik/doldaconnect/"
SRC_URI="http://www.dolda2000.com/~fredrik/doldaconnect/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="acl fnetadc gnome gtk guile ipv6 kerberos keyutils libnotify libxml2 nls pam pidgin static-libs"

RDEPEND="app-arch/bzip2
	sys-libs/gdbm
	gtk? ( x11-libs/gtk+:2 )
	gnome? ( gnome-base/gnome-panel )
	guile? ( dev-scheme/guile[deprecated] )
	kerberos? ( virtual/krb5 )
	keyutils? ( sys-apps/keyutils )
	libnotify? ( x11-libs/libnotify )
	libxml2? ( dev-libs/libxml2 )
	pam? ( virtual/pam )
	pidgin? ( net-im/pidgin )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

pkg_setup() {
	if use gtk && ! use libxml2 ; then
		die you need USE=libxml2 to enable USE=gtk
	fi
}

src_configure() {
	use ipv6 \
		&& export ac_cv_member_struct_sockaddr_in6_sin6_family=yes \
		|| export ac_cv_member_struct_sockaddr_in6_sin6_family=no
	econf \
		$(use_enable nls) \
		$(use_enable static-libs static) \
		--enable-daemon \
		$(use_enable fnetadc) \
		$(use_enable gtk gtk2ui) \
		--enable-dolconf \
		--enable-guishell \
		$(use_enable gnome gnomeapplet) \
		--disable-gaimplugin \
		--enable-baseconv \
		$(use_with pam) \
		$(use_with gtk gtk2) \
		$(use_with libnotify) \
		$(use_with libxml2) \
		$(use_with acl xattr) \
		$(use_with kerberos krb5) \
		$(use_with keyutils) \
		$(use_with guile) \
		|| die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README doc/{TODO,gui-shell,protorev,server-address}|| die
}
