TERMUX_PKG_HOMEPAGE=https://sourceforge.net/p/gawkextlib/code/ci/master/tree/lib/
TERMUX_PKG_DESCRIPTION="A utility library for gawk(1) extension library"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@flosnvjx, @termux-user-repository"
TERMUX_PKG_VERSION="1.0.4"
TERMUX_PKG_SRCURL="https://downloads.sourceforge.net/gawkextlib/$TERMUX_PKG_NAME-$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=ecd06c1857f58530f73866dffb74a32f17d1194c045f351b5ab8acad4f77678c
TERMUX_PKG_DEPENDS="gawk"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="ac_cv_header_libintl_h=no"
TERMUX_PKG_AUTO_UPDATE=true
