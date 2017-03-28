# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Michael Weber (xmw) desktop environment"
SRC_URI=""

SLOT="0"
KEYWORDS=""
IUSE="minimal webmail"

RDEPEND="
	app-admin/conky[weather-metar,thinkpad,mpd,wifi,hddtemp,thinkpad]
	app-misc/hddled[X]
	app-misc/pystopwatch
	app-shells/zsh
	app-text/llpp
	app-text/mupdf
	app-text/paps
	app-text/zathura-cb
	app-text/zathura-djvu
	app-text/zathura-pdf-mupdf
	app-text/zathura-ps
	media-fonts/dina
	media-fonts/terminus-font
	media-gfx/feh
	media-gfx/scrot
	virtual/xmwce
	x11-apps/setxkbmap
	x11-apps/xev
	x11-apps/xkill
	x11-apps/xmodmap
	x11-apps/xrandr
	x11-apps/xset
	x11-base/xorg-server
	x11-misc/alock
	x11-misc/dmenu
	x11-misc/trayer-srg
	x11-misc/trivdm
	x11-misc/wmname
	x11-misc/x2x
	x11-misc/xbindkeys
	x11-misc/xclip
	x11-misc/xdotool
	x11-misc/xscreensaver
	x11-terms/rxvt-unicode[xft]
	x11-wm/cwm
	media-fonts/font-misc-misc
	!minimal? (
		app-text/gv
		media-gfx/gimp
		media-sound/audacity
		media-sound/baudline
		media-video/mpv
		sci-astronomy/stellarium
		sci-electronics/geda
		sci-electronics/osqoop
		sci-geosciences/googleearth
		|| ( www-client/firefox www-client/firefox-bin )
		www-client/google-chrome-unstable
		www-plugins/adobe-flash
		x11-terms/xterm
		!webmail? ( mail-client/thunderbird )
	)"
