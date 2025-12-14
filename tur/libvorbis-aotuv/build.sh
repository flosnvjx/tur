TERMUX_PKG_HOMEPAGE=https://github.com/AO-Yumi/vorbis_aotuv
TERMUX_PKG_DESCRIPTION="Library for using the Ogg Vorbis compressed audio format (aoTuV fork)"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@flosnvjx"
## renumbering aoTuV's version string to match its corresponding Xiph.org upstream release that aoTuV rebased on:
TERMUX_PKG_VERSION=1.3.8.b6.0.3.2020
TERMUX_PKG_SRCURL=https://github.com/AO-Yumi/vorbis_aotuv/archive/refs/tags/beta6.03-2020.tar.gz
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_DEPENDS="libogg"
TERMUX_PKG_PROVIDES="libvorbis (=1.3.8)"
TERMUX_PKG_CONFLICTS="libvorbis"
TERMUX_PKG_REPLACES="libvorbis"

termux_step_pre_configure() {
	autoreconf -fi
}
