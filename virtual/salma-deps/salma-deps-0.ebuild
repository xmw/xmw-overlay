# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Dependencies for diploma thesis software"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/PyCLP
	dev-python/matplotlib
	dev-python/statsmodels
	dev-python/numpy
	dev-python/nose
	dev-python/celery
	dev-python/pyside
	dev-util/eclipse-cpl[coin]
	net-misc/rabbitmq-server"
DEPEND="${RDEPEND}"
