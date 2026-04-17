TERMUX_PKG_HOMEPAGE="https://github.com/ClueLang/Cluna"
TERMUX_PKG_DESCRIPTION="A reverse transpiler for Clue programming language"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux-user-repository, @flosnvjx"
TERMUX_PKG_VERSION="1.1.2"
TERMUX_PKG_SRCURL="https://github.com/ClueLang/Cluna/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_make() {
	cargo build --jobs $TERMUX_PKG_MAKE_PROCESSES --target $CARGO_TARGET_NAME \
		--release #--locked
}

termux_step_make_install() {
	install -vDm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/cluna
	install -vDm600 -t $TERMUX_PREFIX/share/doc/cluna README*
}
