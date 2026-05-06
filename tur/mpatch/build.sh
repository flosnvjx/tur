TERMUX_PKG_HOMEPAGE="https://github.com/Romelium/mpatch"
TERMUX_PKG_DESCRIPTION="Applying patches based on fuzzy context (useful in LLM-assisted programming scenario)"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="1.4.4"
_VERSIONED_TAG_IS_AT_COMMIT=289b119d9cfa1cafd096322898dc875f4893e222
TERMUX_PKG_SRCURL="git+https://github.com/Romelium/mpatch"
TERMUX_PKG_GIT_BRANCH=main
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=false ## plz manually audit changes

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout $_VERSIONED_TAG_IS_AT_COMMIT

	local _git_describe
	_git_describe="$(git describe)"

	if [ "$_git_describe" != "v$TERMUX_PKG_VERSION" ]; then
		termux_error_exit "TERMUX_PKG_VERSION diffrent from actual git tag version ($TERMUX_PKG_VERSION != $_git_describe)"
	fi

	local _crate_version
	_crate_version="$(awk '/^\[[^\]]+]$/{gsub(/\[|]/,"");sect=$0}sect=="package"&&/^version = "[0-9.]+"/' Cargo.toml | sed -Ee 's@^version = "([0-9.]+)"$@\1@')"

	if [ "$_crate_version" != "$TERMUX_PKG_VERSION" ]; then
		termux_error_exit "TERMUX_PKG_VERSION diffrent from actual git tag version ($TERMUX_PKG_VERSION != $_crate_version)"
	fi
}

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_make() {
	cargo build --jobs $TERMUX_PKG_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release --locked
}

termux_step_make_install() {
	install -vDm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/mpatch
	install -vDm600 -t $TERMUX_PREFIX/share/doc/mpatch README* CHANGELOG*
}
