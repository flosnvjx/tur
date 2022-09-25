TERMUX_PKG_HOMEPAGE=http://www.garloff.de/kurt/linux/ddrescue/
TERMUX_PKG_DESCRIPTION="dd(1) alternative without POSIX-correctness burden to ease data recovery"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_LICENSE_FILE="COPYING"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="1.99.12"
TERMUX_PKG_SRCURL="http://www.garloff.de/kurt/linux/ddrescue/dd_rescue-${TERMUX_PKG_VERSION}.tar.bz2"
TERMUX_PKG_SHA256=f304750aecf2b04a4798b26373a66483cf075e0a8e4619e78dc307e8f794c895
#TERMUX_PKG_DEPENDS="openssl"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_METHOD=repology

termux_step_pre_configure() {
	cd "$TERMUX_PKG_SRCDIR"
	#CFLAGS+=" $CPPFLAFS"
	#EXTRA_LDFLAGS=" $LDFLAGS"
	autoreconf -fi
	pwd
	ls -R .
}
