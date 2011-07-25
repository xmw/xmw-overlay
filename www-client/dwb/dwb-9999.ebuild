# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit mercurial toolchain-funcs

DESCRIPTION="lightweight webbrowser written in C based on webkit and gtk"
HOMEPAGE="https://bitbucket.org/portix/dwb/overview"
SRC_URI=""
EHG_REPO_URI="https://bitbucket.org/portix/dwb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="net-libs/webkit-gtk:3
	x11-libs/gtk+:3"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	sed -e 's:$(CC) $(FLAGS) $(OBJ) -o $(TARGET):$(CC) $(FLAGS) $(LDFLAGS) $(OBJ) -o $(TARGET):' \
		-e 's:@$(CC):$(CC):' \
		-i src/Makefile
	sed -e '1iFLAGS=$(CFLAGS)' \
		-e '/^FLAGS += -Wall/d' \
		-e '/^LIBS  += gtk+-2.0$/d' \
		-e '/^LIBS  += webkit-1.0$/d' \
		-e '/^#LIBS  += gtk+-3.0$/s:#::' \
		-e '/^#LIBS  += webkitgtk-3.0$/s:#::' \
		-i config.mk
}

src_compile() {
	emake CC="$(tc-getCC)" || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}
