# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="a powerful application launcher by running a specialized bash session"
HOMEPAGE="http://bashrun.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="|| ( 
		x11-apps/xmessage 
		gnome-extra/zenity 
		kde-base/kdialog )
	|| (
		x11-terms/xterm 
		x11-terms/aterm
		x11-terms/mlterm
		x11-terms/mrxvt 
		x11-terms/rxvt 
		x11-terms/rxvt-unicode
	)"

src_install() {
	dobin ${PN} || die

	insinto /usr/share
	doins bashrc  || die

	doman bashrun.1 || die
	dodoc CHANGELOG || die
}
