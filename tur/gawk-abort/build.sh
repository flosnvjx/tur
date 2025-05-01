TERMUX_PKG_HOMEPAGE=https://gawkextlib.sourceforge.net/
TERMUX_PKG_DESCRIPTION="gawk(1) extension library for exiting without running END rules"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="1.0.1"
TERMUX_PKG_SRCURL="https://downloads.sourceforge.net/gawkextlib/$TERMUX_PKG_NAME-$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=61a007421159607131d0b7d730948b696db2d03694bac40eb54265a5c9c023b5
TERMUX_PKG_DEPENDS="gawk"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="ac_cv_header_libintl_h=no"
TERMUX_PKG_AUTO_UPDATE=true
