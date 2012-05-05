# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

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
	app-portage/genlop
	app-portage/layman[git]
	app-portage/pfl
	app-shells/zsh
	app-shells/zsh-completion
	app-text/wgetpaste
	app-vim/gnupg
	dev-util/strace
	dev-vcs/git
	media-gfx/exif
	media-sound/mpc
	net-analyzer/netcat6
	net-analyzer/tcpdump
	net-dns/bind-tools
	net-firewall/iptables
	net-misc/openssh
	net-misc/whois
	sys-apps/iproute2
	sys-apps/less
	sys-apps/lshw
	sys-apps/mlocate
	sys-apps/pv
	sys-block/buffer
	sys-fs/ddrescue
	sys-fs/ncdu
	sys-fs/sshfs-fuse
	sys-process/htop
	sys-process/iotop
	dev? (
		app-portage/eix
		app-portage/gentoolkit
		app-portage/gentoolkit-dev
		app-portage/pfl
	)
	"
DEPEND=""
