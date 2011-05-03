# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit netsurf

DESCRIPTION="CSS parser and selection engine, written in C"

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/libparserutils
	dev-libs/libwapcaplet"
DEPEND="${RDEPEND}
	test? (	dev-lang/perl )"

DOCS=( README )
