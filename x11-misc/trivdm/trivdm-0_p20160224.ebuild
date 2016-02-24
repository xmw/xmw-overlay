# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils readme.gentoo user

DESCRIPTION="trivial display manager"
HOMEPAGE="http://xmw.de/tmp/trivdm"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-admin/sudo
	app-misc/toilet
	app-shells/zsh
	sys-apps/daemonize
	sys-apps/kbd
	sys-libs/ncurses:0"
DEPEND=""

S=${WORKDIR}

pkg_postinst() {
	enewgroup ${PN}
	enewuser ${PN} -1 /usr/bin/${PN} -1 ${PN}

	readme.gentoo_print_elog
}

src_install() {
	newbin "${FILESDIR}"/${P} ${PN}

	echo "CONFIG_PROTECT=\"/usr/bin/${PN}\"" > "${T}"/90${PN} || die
	doenvd "${T}"/90${PN}

	echo "#${PN} ALL=(root) NOPASSWD: /sbin/reboot,/sbin/halt" \
		> "${T}"/${PN} || die
	insopts -m0440
	insinto /etc/sudoers.d
	doins "${T}"/${PN}

	readme.gentoo_create_doc
}

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="Your system needs 5 minor adjustments that
must not be made by Gentoo portage system:
1) enable xscreensaver->newlogin compartibility
    ln -s ../../bin/${PN} /usr/local/bin/gdmflexiserver
2) tune w to display remote login sessions and daemonized X11
    ln -s ../../bin/${PN} /usr/local/bin/w
3) set a fancy font on framebuffer console on startup
    ln -s ../../usr/bin/${PN} /etc/local.d/${PN}.start
4) grant chvt to everyone
    chmod u+s /usr/bin/chvt
5) updated /etc/inittab (etc-update, dispatch-conf, ...) and reload
    echo \"c7:2345:respawn:/usr/bin/openvt -c 7 -f -w /usr/bin/trivdm\" \
		> /etc/inittab 
    kill -HUP 1
Install app-admin/sudo and review /etc/sudoers.d/${PN}"
