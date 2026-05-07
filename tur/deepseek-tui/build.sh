TERMUX_PKG_HOMEPAGE="https://github.com/Hmbown/DeepSeek-TUI"
TERMUX_PKG_DESCRIPTION="Coding agent for DeepSeek models that runs in your terminal"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="0.8.14"
TERMUX_PKG_SRCURL="https://github.com/Hmbown/DeepSeek-TUI/archive/refs/tags/v$TERMUX_PKG_VERSION"
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_make() {
	cargo build --jobs $TERMUX_PKG_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release --locked
}

termux_step_make_install() {
	install -vDm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/deepseek{,-tui}
	install -vDm600 -t $TERMUX_PREFIX/share/doc/deepseek-tui README* CHANGELOG*
}
