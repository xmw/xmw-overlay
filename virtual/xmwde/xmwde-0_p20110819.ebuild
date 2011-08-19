# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Michael Weber (xmw) desktop environment"
SRC_URI=""

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	app-admin/conky
	app-admin/conkyforecast
	app-editors/gvim
	app-misc/hddled[X]
	app-shells/zsh
	app-text/evince
	app-text/llpp
	app-text/mupdf
	app-text/paps
	gnome-base/gnome-keyring
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
	|| ( x11-misc/trayer-srg x11-misc/trayer-srg )
	x11-misc/x2x
	x11-misc/xbindkeys
	x11-misc/xclip
	x11-misc/xscreensaver
	x11-terms/rxvt-unicode
	x11-wm/cwm
	x11-apps/xset
	x11-apps/xkill
	x11-apps/xev
	x11-misc/alock
	x11-misc/wmname
	x11-misc/xdotool
	"
