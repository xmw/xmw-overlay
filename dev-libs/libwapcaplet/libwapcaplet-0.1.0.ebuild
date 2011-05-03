# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit flag-o-matic netsurf

DESCRIPTION="string internment library, written in C"

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="dev-util/pkgconfig
	test? (	dev-libs/check )"

DOCS=( README )
