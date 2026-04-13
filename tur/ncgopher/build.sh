TERMUX_PKG_HOMEPAGE="https://github.com/jansc/ncgopher"
TERMUX_PKG_DESCRIPTION="A TUI gopher/gemini client for modern Internet"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_VERSION="0.8.0"
TERMUX_PKG_DEPENDS="libsqlite, ncurses"
TERMUX_PKG_SRCURL="https://github.com/jansc/ncgopher/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=c91b139fd3ec89dd1c20c75350de1a21624c03b16d086d9e7dd4e5dd8c829761
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_make() {
	cargo build --jobs $TERMUX_PKG_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release --locked
}

termux_step_make_install() {
	install -vDm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/ncgopher
	install -vDm600 -t $TERMUX_PREFIX/share/doc/ncgopher README* CHANGELOG* ROADMAP*
	install -vDm600 -t $TERMUX_PREFIX/share/man/man1 ncgopher.1
}
