TERMUX_PKG_HOMEPAGE=https://gawkextlib.sourceforge.net/select/select.html
TERMUX_PKG_DESCRIPTION="gawk(1) extension library for I/O multiplexing"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="1.1.4"
TERMUX_PKG_SRCURL="https://downloads.sourceforge.net/gawkextlib/$TERMUX_PKG_NAME-$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=35fbaf4180851c9230dc2fa5272b669d77842ee4bfedbbdbb534e92219f99bcd
TERMUX_PKG_DEPENDS="gawk"
TERMUX_PKG_BUILD_DEPENDS="gawkextlib"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="ac_cv_header_libintl_h=no"
TERMUX_PKG_AUTO_UPDATE=true

termux_step_post_make_install() {
	cd "$TERMUX_PKG_SRCDIR"
	install -Dm644 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME ChangeLog NEWS multiplex.awk multiplex2.awk test/nonblock.awk test/select.awk test/signal.awk test/timeout_parse.awk
}
