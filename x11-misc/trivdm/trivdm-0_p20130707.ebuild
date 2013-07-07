# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils user

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
	sys-apps/kbd"
DEPEND=""

S=${WORKDIR}

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 /usr/bin/${PN} -1 ${PN}
}

src_install() {
	newbin "${FILESDIR}"/${P} ${PN} || die
	dodir /etc/env.d || die
	echo "CONFIG_PROTECT=\"/usr/bin/${PN}\"" \
		> "${D}"/etc/env.d/90${PN} || die
	dodir /etc/sudoers.d || die
	echo "#${PN} ALL=(root) NOPASSWD: /sbin/reboot,/sbin/halt" \
		> "${D}"/etc/sudoers.d/${PN} || die
	chmod 0440 "${D}"/etc/sudoers.d/${PN} || die
}

pkg_preinst() {
	sed -e "/^c7:/d" /etc/inittab > "${ED}"/etc/inittab || die
	sed -n -e '/c7:/{s/^.*c7:/c7:/ ; s:/local/:/: ; p}' \
		"${ED}"/usr/bin/${PN} >> "${ED}"/etc/inittab || die

	elog "IMPORTANT NOTE"
	elog "Your system needs 5 minor adjustments that"
	elog "must not be made by Gentoo portage system:"
	elog "1) enable xscreensaver->newlogin compartibility"
	elog "    ln -s ../../bin/${PN} /usr/local/bin/gdmflexiserver"
	elog "2) tune w to display remote login sessions and daemonized X11"
	elog "    ln -s ../../bin/${PN} /usr/local/bin/w"
	elog "3) set a fancy font on framebuffer console on startup"
	elog "    ln -s ../../usr/bin/${PN} /etc/local.d/${PN}.start"
	elog "4) grant chvt to everyone"
	elog "    chmod u+s /usr/bin/chvt"
	elog "5) updated /etc/inittab (etc-update, ...) and reload"
	elog "    kill -HUP 1"
	elog "Install app-admin/sudo and review /etc/sudoers.d/${PN}"
}
