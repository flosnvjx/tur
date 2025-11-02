#TERMUX_PKG_HOMEPAGE=https://github.com/fastcat/tarix
TERMUX_PKG_DESCRIPTION="Utility to convert an Alcohol 120% mdf image"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@flosnvjx, @termux-user-repository"
TERMUX_PKG_VERSION="3.0.1"
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_SRCURL="git+https://salsa.debian.org/debian/mdf2iso"
TERMUX_PKG_BUILD_IN_SRC=true

#termux_step_make() {
#	make CC="${CC:-cc}" CPPFLAGS="-I. -Isrc -D_GNU_SOURCE $CPPFLAGS" OPTCFLAGS="$CFLAGS -Wno-error=misleading-indentation" LDFLAGS="$LDFLAGS -lz"
#}

#termux_step_post_make_install() {
#	install -Dm644 -t "$TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME" README BUGS CREDITS ChangeLog FORMAT Limitations QuickStart TODO Zlib
#}
