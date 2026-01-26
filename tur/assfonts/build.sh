TERMUX_PKG_HOMEPAGE="https://github.com/wyzdwdz/assfonts"
TERMUX_PKG_DESCRIPTION="Subsetting fonts for embedding in an ASS subtitle"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="0.7.3"
TERMUX_PKG_SRCURL="git+https://github.com/wyzdwdz/assfonts"
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_GIT_BRANCH=main

termux_step_post_get_source() {
	git fetch --unshallow --no-recurse-submodules
	git checkout "v$TERMUX_PKG_VERSION"
	git submodule update --init --recursive --depth=1
}
