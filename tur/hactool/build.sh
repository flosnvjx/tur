TERMUX_PKG_HOMEPAGE="https://github.com/SciresM/hactool/releases"
TERMUX_PKG_DESCRIPTION="Tool to view, decrypt, and extract common file formats for the Nintendo Switch, especially Nintendo Content Archives"
TERMUX_PKG_LICENSE="ISC"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="1.4.0"
TERMUX_PKG_SRCURL="https://github.com/SciresM/hactool/archive/refs/tags/$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=1373c98ef8c58da42cb1e81b361283955caad0e1b8b5ad389b0ee49b7a21da43
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_TAG_TYPE="latest-release-tag"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_post_get_source() {
	sed -e '/^CC = /d' config.mk.template > config.mk
}

termux_step_make() {
	export CC="$CC $CFLAGS $CPPFLAGS $LDFLAGS"
	make -j $TERMUX_PKG_MAKE_PROCESSES
}

termux_step_make_install() {
	install -Dm755 -t "$TERMUX_PREFIX/bin" ./hactool
	install -Dm644 -t "$TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME" README.*
}
