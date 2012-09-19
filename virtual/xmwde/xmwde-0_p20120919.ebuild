# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Michael Weber (xmw) desktop environment"
SRC_URI=""

SLOT="0"
KEYWORDS=""
IUSE="minimal"

RDEPEND="
	app-admin/conky[metar,mpd,thinkpad,weather]
	app-editors/gvim
	app-misc/hddled[X]
	app-misc/pystopwatch
	app-shells/zsh
	app-text/evince
	app-text/llpp
	app-text/mupdf
	app-text/paps
	gnome-base/gnome-keyring
	media-fonts/dina
	media-fonts/terminus-font
	media-gfx/feh
	media-gfx/scrot
	net-misc/hotot
	virtual/xmwce
	x11-apps/setxkbmap
	x11-apps/xev
	x11-apps/xkill
	x11-apps/xmodmap
	x11-apps/xrandr
	x11-apps/xset
	x11-base/xorg-server
	x11-misc/alock
	x11-misc/dmenu[xft]
	x11-misc/trayer-srg
	x11-misc/trivdm
	x11-misc/wmname
	x11-misc/x2x
	x11-misc/xbindkeys
	x11-misc/xclip
	x11-misc/xdotool
	x11-misc/xscreensaver
	x11-terms/rxvt-unicode[256-color,xft]
	x11-wm/cwm
	media-fonts/font-misc-misc
	!minimal? (
		app-text/evince
		app-text/gv
		mail-client/thunderbird
		media-gfx/gimp
		media-sound/audacity
		media-sound/baudline
		media-video/avidemux
		|| ( media-video/mplayer media-video/mplayer2 )
		net-im/pidgin
		net-p2p/qbittorrent
		sci-astronomy/stellarium
		sci-electronics/geda
		sci-electronics/osqoop
		sci-geosciences/googleearth
		www-client/firefox
		www-client/google-chrome:unstable
		www-client/opera
		www-plugins/adobe-flash
		x11-terms/xterm
	)"
