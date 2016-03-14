# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Michael Weber (xmw) console environment"
SRC_URI=""

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+dev"

RDEPEND="
	app-admin/makepasswd
	app-arch/lzop
	app-arch/zip
	app-editors/vim
	app-misc/screen
	app-misc/when
	app-portage/eix
	app-portage/eix
	app-portage/genlop
	app-portage/layman[git]
	app-portage/pfl
	app-shells/zsh
	app-text/wgetpaste
	app-vim/gnupg
	dev-util/strace
	dev-vcs/git
	media-gfx/exif
	media-sound/mpc
	net-analyzer/iptraf-ng
	net-analyzer/netcat6
	net-analyzer/nmap
	net-analyzer/tcpdump
	net-dns/bind-tools
	net-firewall/iptables
	net-misc/mosh
	net-misc/openssh
	net-misc/telnet-bsd
	net-misc/whois
	sys-apps/ethtool
	sys-apps/iproute2
	sys-apps/less
	sys-apps/lshw
	sys-apps/mlocate
	sys-apps/pciutils
	sys-apps/pv
	sys-block/buffer
	sys-fs/ddrescue
	sys-fs/ncdu
	sys-fs/sshfs
	sys-process/htop
	sys-process/iotop
	sys-process/parallel
	dev? (
		app-portage/gentoolkit
		app-portage/gentoolkit-dev
	)"
DEPEND=""
