TERMUX_PKG_HOMEPAGE=https://github.com/Goldziher/uncomment
TERMUX_PKG_DESCRIPTION="Remove comments from code files"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="3.0.2"
TERMUX_PKG_SRCURL="https://github.com/Goldziher/uncomment/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=77c68923fcbbb0e61f926a70770901cc4945e3e30a7219a06b78788d539b802c
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	termux_setup_rust
	cargo build --jobs $TERMUX_PKG_MAKE_PROCESSES --release --target $CARGO_TARGET_NAME --locked
}

termux_step_make_install() {
	install -Dm700 $TERMUX_PKG_SRCDIR/target/${CARGO_TARGET_NAME}/release/uncomment "${TERMUX_PREFIX}/bin/uncomment"
}
