TERMUX_PKG_HOMEPAGE="https://github.com/enzo1982/mp4v2"
TERMUX_PKG_DESCRIPTION="Library and tools to read, create, and modify mp4 files"
TERMUX_PKG_LICENSE="Mozilla-1.1"
TERMUX_PKG_LICENSE_FILE="COPYING"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="2.1.3+2"
TERMUX_PKG_SRCURL="git+https://github.com/enzo1982/mp4v2"
_COMMIT=c724815a541b763455ff38922af96f652627bce6
TERMUX_PKG_GIT_BRANCH=main
TERMUX_PKG_SHA256=SKIP_CHECKSUM

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout "$_COMMIT"
}

termux_step_pre_configure() {
	autoreconf -fi

	export FOUND_HELP2MAN=no
}
