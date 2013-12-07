# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Create initrd using python"
HOMEPAGE="http://xmw.de"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="-minimal"

DEPEND=""
RDEPEND="
	sys-apps/sed
	!minimal? (
		app-arch/cpio
		app-arch/pbzip2
		app-arch/tar
		app-cdr/cdrtools
		app-editors/nano
		app-misc/pax-utils
		app-misc/screen
		app-shells/zsh
		app-shells/zsh-completion
		dev-util/strace
		dev-util/vbindiff
		net-analyzer/iptraf-ng
		net-analyzer/netcat6
		net-dns/bind-tools
		net-misc/curl
		net-misc/iputils
		net-misc/dhcp
		net-misc/ntp
		net-misc/openssh
		net-misc/rsync
		net-misc/wget
		net-wireless/rfkill
		sys-apps/kmod
		sys-apps/util-linux
		net-wireless/wpa_supplicant
		sys-apps/coreutils
		sys-apps/diffutils
		sys-apps/ethtool
		sys-apps/findutils
		sys-apps/gawk
		sys-apps/grep
		sys-apps/iproute2
		sys-apps/less
		sys-apps/man
		sys-apps/net-tools
		sys-apps/pciutils
		sys-apps/pv
		sys-apps/sed
		sys-apps/shadow
		sys-apps/smartmontools
		sys-apps/sysvinit
		sys-apps/usbutils
		sys-fs/cryptsetup
		sys-fs/ddrescue
		sys-fs/e2fsprogs
		sys-fs/lvm2
		sys-fs/mdadm
		sys-fs/multipath-tools
		sys-fs/xfsprogs
		sys-libs/gpm
		sys-process/htop
		sys-process/procps
		sys-process/psmisc
		www-client/links
		www-client/w3m
	)"

S=${WORKDIR}

src_install() {
	newsbin "${FILESDIR}"/${P} ${PN}.py
}
