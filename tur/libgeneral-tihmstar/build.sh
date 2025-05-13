TERMUX_PKG_HOMEPAGE="https://github.com/tihmstar/libgeneral"
TERMUX_PKG_DESCRIPTION="General library of @tihmstar's software projects"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="84"
_COMMIT=03e33a356abd0ced4bfce8df9e9644edeaf2920c
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_SRCURL="git+https://github.com/tihmstar/libgeneral"

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout "$_COMMIT"
}
termux_step_pre_configure() {
	NOCONFIGURE=1 ./autogen.sh
}
