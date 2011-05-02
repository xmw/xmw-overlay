# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="xmws desktop environment"
HOMEPAGE="http://xmw.de"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	app-admin/conky
	app-admin/conkyforecast
	app-editors/gvim
	app-shells/zsh
	app-text/evince
	app-text/llpp
	app-text/mupdf
	app-text/paps
	gnome-extra/gnome-utils
	media-fonts/dina
	media-fonts/terminus-font
	media-gfx/feh
	net-misc/hotot
	x11-apps/setxkbmap
	x11-apps/xmodmap
	x11-apps/xrandr
	x11-base/xorg-server
	x11-misc/dmenu
	x11-misc/trayer
	x11-misc/x2x
	x11-misc/xbindkeys
	x11-misc/xscreensaver
	x11-terms/gnome-terminal
	x11-terms/rxvt-unicode
	x11-wm/cwm
	"

