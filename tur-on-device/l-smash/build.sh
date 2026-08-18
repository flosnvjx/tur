TERMUX_PKG_HOMEPAGE="https://github.com/l-smash/l-smash"
TERMUX_PKG_DESCRIPTION="Portable library for creating, reading and editing MP4/MOV files"
TERMUX_PKG_LICENSE="ISC"
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_VERSION="2.14.5"
TERMUX_PKG_SRCURL="https://github.com/l-smash/l-smash/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=e6f7c31de684f4b89ee27e5cd6262bf96f2a5b117ba938d2d606cf6220f05935
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true

# l-smash uses a custom configure script that does not accept the flags
# passed by termux's autotools configure step (e.g. --host, --disable-rpath),
# so it is invoked manually here. Cross compilation is handled via --cc,
# since the termux clang wrapper carries the target and sysroot.
termux_step_configure() {
	cd "$TERMUX_PKG_SRCDIR"
	./configure \
		--prefix="$TERMUX_PREFIX" \
		--libdir="$TERMUX_PREFIX/lib" \
		--includedir="$TERMUX_PREFIX/include" \
		--cc="$CC" \
		--enable-shared \
		$TERMUX_PKG_EXTRA_CONFIGURE_ARGS
}
