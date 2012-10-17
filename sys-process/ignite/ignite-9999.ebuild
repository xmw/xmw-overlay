# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 toolchain-funcs

DESCRIPTION="set of scripts to boot using runit for service supervision"
HOMEPAGE="https://github.com/chneukirchen/ignite"
EGIT_REPO_URI="https://github.com/chneukirchen/ignite.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

#depends=('bash' 'util-linux' 'procps-ng' 'runit-musl' 'sysvinit-tools')
#makedepends=('gcc' 'make' 'coreutils' 'sed' 'musl')

src_compile() {
	cd ignite/util
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	dobin ignite/util/pause
	doman ignite/util/pause.1

	insinto /
	doins -r ignite/etc
}
