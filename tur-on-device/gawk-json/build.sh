TERMUX_PKG_HOMEPAGE=https://gawkextlib.sourceforge.net/json/json.html
TERMUX_PKG_DESCRIPTION="gawk(1) extension library for working with JSON data"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="2.0.1"
TERMUX_PKG_SRCURL="https://downloads.sourceforge.net/gawkextlib/$TERMUX_PKG_NAME-$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=27a4fc0b8bf4f6229fffd9ef98dc90c685de50571723b731ddfc48af0c3a5ee2
TERMUX_PKG_DEPENDS="gawk"
TERMUX_PKG_BUILD_DEPENDS="rapidjson"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="ac_cv_header_libintl_h=no"
TERMUX_PKG_AUTO_UPDATE=true

termux_step_post_make_install() {
	cd "$TERMUX_PKG_SRCDIR"
	install -Dm644 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME test/*.awk test/*.ok
}
