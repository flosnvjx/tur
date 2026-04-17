TERMUX_PKG_HOMEPAGE="https://github.com/ClueLang/Clue"
TERMUX_PKG_DESCRIPTION="A programming language that transpiles to Lua, with syntax similar to C or Rust"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux-user-repository, @flosnvjx"
TERMUX_PKG_VERSION="3.4.7+r11+20241012"
_COMMIT=78ce10c1d7a985b294ce7d08ef03565cc956e3c1
TERMUX_PKG_SRCURL="git+https://github.com/ClueLang/Clue.git"
TERMUX_PKG_BUILD_DEPENDS="luajit"
TERMUX_PKG_RECOMMENDS="luajit"
TERMUX_PKG_GIT_BRANCH=main
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_BUILD_IN_SRC=true
#TERMUX_PKG_AUTO_UPDATE=true

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout $_COMMIT

	local version="$(TZ=UTC git describe --tags --long | gawk 'match($0,/^v?([0-9A-Za-z._]+)-([0-9]+)-g[0-9a-f]+$/,a){cmd="git log -1 --format=%cd --date=format:%Y%m%d";cmd|getline d;close(cmd);print a[1] "+r" a[2] "+" d;exit}{exit 1}')"

	if [ "$TERMUX_PKG_VERSION" != "$version" ]; then
		termux_error_exit "TERMUX_PKG_VERSION diffrent from actual git describe result ($TERMUX_PKG_VERSION != $version), please consider bumping the TERMUX_PKG_VERSION" ## or comment-out tnis
	fi

}

termux_step_pre_configure() {
	termux_setup_rust

	gawk -i inplace '/^\[dependencies\]/,x++&&/^\[[^]]+\]/{/^mlua =/&&sub(/features = \[[^]]*\]/,"features = [\"luajit\"]")}1' cli/Cargo.toml
}

termux_step_make() {
	cargo build --jobs $TERMUX_PKG_MAKE_PROCESSES --target $CARGO_TARGET_NAME \
		--no-default-features \
		--features interpreter \
		--release #--locked
}

termux_step_make_install() {
	install -vDm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/clue
	install -vDm600 -t $TERMUX_PREFIX/share/doc/clue README*
	install -vDm600 -t $TERMUX_PREFIX/share/doc/clue/examples examples/*

	## after cargo build
	git clone --depth 1 https://github.com/ClueLang/Clue.wiki.git $TERMUX_PKG_BUILDDIR/wiki
	install -vDm600 -t $TERMUX_PREFIX/share/doc/clue/wiki $TERMUX_PKG_BUILDDIR/wiki/*
}
