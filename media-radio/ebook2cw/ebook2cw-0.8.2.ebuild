# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit toolchain-funcs

DESCRIPTION="command line program which converts a plain text ebook to Morse code audio files"
HOMEPAGE="http://fkurz.net/ham/ebook2cw.html"
SRC_URI="http://fkurz.net/ham/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="lame vorbis"

RDEPEND="lame? ( media-sound/lame )
	vorbis? ( media-libs/libogg
		media-libs/libvorbis )"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -e 's/gcc/$(CC)/' \
		-i Makefile || die
}

src_compile() {
	emake CC=$(tc-getCC) \
		USE_LAME=$(usex lame YES NO) \
		USE_OGG=$(usex vorbis YES NO)
}

src_install() {
	dobin ${PN}
	doman ${PN}.1
	dodoc ChangeLog README ${PN}.conf isomap.txt utf8map.txt
}
