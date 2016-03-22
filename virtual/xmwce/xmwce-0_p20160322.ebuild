# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Michael Weber (xmw) console environment"
SRC_URI=""

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+dev +root +wlan +kernel mpc"

RDEPEND="
	app-admin/makepasswd
	app-arch/hardlink
	app-arch/zip
	app-editors/vim
	app-misc/screen
	app-misc/when
	app-portage/eix
	app-portage/genlop
	app-portage/pfl
	app-shells/zsh
	app-vim/gnupg
	dev-util/strace
	dev-vcs/git
	media-gfx/exif
	net-analyzer/netcat6
	net-analyzer/nmap
	net-dns/bind-tools
	net-misc/mosh
	net-misc/openssh
	net-misc/telnet-bsd
	net-misc/whois
	sys-apps/iproute2
	sys-apps/less
	sys-apps/mlocate
	sys-apps/pv
	sys-block/buffer
	sys-fs/ncdu
	sys-fs/sshfs
	sys-process/glances
	sys-process/htop
	sys-process/iotop
	sys-process/parallel
	dev? (
		app-portage/gentoolkit
		app-portage/gentoolkit-dev
	)
	kernel? (
		app-admin/eclean-kernel
		app-arch/cpio
		app-arch/lz4
		app-arch/lzop
	)
	mpc? (
		media-sound/ncmpcpp[outputs,clock,visualizer,curl]
	)
	root? (
		app-admin/syslog-ng
		app-admin/tmpreaper
		app-portage/layman[git]
		app-portage/porticron
		mail-mta/postfix
		net-analyzer/iptraf-ng
		net-analyzer/tcpdump
		net-firewall/iptables
		net-misc/dhcp
		net-misc/ntp
		sys-apps/ethtool
		sys-apps/hwloc
		sys-apps/lm_sensors
		sys-apps/lshw
		sys-apps/pciutils
		sys-apps/usbutils
		sys-fs/ddrescue
		sys-libs/gpm
		sys-process/dcron
		amd64? (
			sys-apps/smartmontools
			sys-power/acpid
			sys-power/cpupower
		)
	)
	wlan? (
		net-wireless/iw
		net-wireless/wireless-tools
		net-wireless/wpa_supplicant
	)
	"
DEPEND=""
