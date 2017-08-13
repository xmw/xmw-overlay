# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="fake keyboard/mouse input, window management, and more "
HOMEPAGE="http://www.semicomplete.com/projects/xdotool/#idp9392"
EGIT_REPO_URI="https://github.com/jordansissel/${PN}.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="examples"

RDEPEND="x11-libs/libXtst
	x11-libs/libX11
	x11-libs/libXinerama
	x11-libs/libxkbcommon"
DEPEND="${RDEPEND}"

# The test wants to manualy start Xvfb, wont use VirtualX and it tries
# to run a full gnome-session. For such a tiny application i consider
# it overkill to rewrite the test scripts to not use it's own X server
# and add a full blown gnome just to run the tests.
RESTRICT="test"

src_prepare() {
	sed -i \
		-e "s/installheader post-install$/installheader/" \
		-e 's:\<pkg-config\>:$(PKG_CONFIG):' \
		Makefile || die "sed failed"
}

src_compile() {
	tc-export CC LD PKG_CONFIG
	default
}

src_install() {
	emake PREFIX="${D}usr" INSTALLMAN="${D}usr/share/man" INSTALLLIB="${D}usr/$(get_libdir)" install || die

	dodoc CHANGELIST README
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/*
	fi
}
