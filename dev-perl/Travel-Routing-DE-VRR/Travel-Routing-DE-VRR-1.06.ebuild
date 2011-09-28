# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MODULE_AUTHOR="DERF"
inherit perl-module

DESCRIPTION="inofficial interface to the efa.vrr.de German itinerary service"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/Class-Accessor
	dev-perl/Exception-Class"
DEPEND="${RDEPEND}
	dev-perl/Test-Compile
	dev-perl/Test-Fatal
	dev-perl/Test-Pod
	virtual/perl-Module-Build"

SRC_TEST="do"
