TERMUX_PKG_HOMEPAGE="https://ast-grep.github.io"
TERMUX_PKG_DESCRIPTION="CLI tool for code structural search, lint and rewriting"
TERMUX_PKG_VERSION="0.42.1"
TERMUX_PKG_SRCURL="https://github.com/ast-grep/ast-grep/archive/refs/tags/$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_make() {
	cargo build --jobs $TERMUX_PKG_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release --locked
}

termux_step_make_install() {
	install -Dm700 target/$CARGO_TARGET_NAME/release/ast-grep "$TERMUX_PREFIX/bin/ast-grep"
	ln -sr "$TERMUX_PREFIX"/bin/{ast-grep,sg} # alias.rs at ast-grep/ast-grep - https://github.com/ast-grep/ast-grep/blob/main/crates/cli/src/bin/alias.rs

	git clone --depth 1 --single-branch https://github.com/ast-grep/ast-grep.github.io
	mkdir -p "${TERMUX_PREFIX}"/share/doc/ast-grep/_html-source
	find  ast-grep.github.io/website/ -maxdepth 1 -type d -regex "/\\(advanced\\|catalog\\|cheatsheet\\|guide\\|reference\\)$" -exec mv -t "${TERMUX_PREFIX}"/share/doc/ast-grep/_html-source '{}' ';'
	install -m600 -t "${TERMUX_PREFIX}"/share/doc/ast-grep README*

	mkdir -p "${TERMUX_PREFIX}"/share/bash-completion/completions
	mkdir -p "${TERMUX_PREFIX}"/share/elvish/lib
	mkdir -p "${TERMUX_PREFIX}"/share/fish/vendor_completions.d
	mkdir -p "${TERMUX_PREFIX}"/share/zsh/site-functions
	touch "${TERMUX_PREFIX}"/share/bash-completion/completions/ast-grep
	touch "${TERMUX_PREFIX}"/share/elvish/lib/ast-grep.elv
	touch "${TERMUX_PREFIX}"/share/fish/vendor_completions.d/ast-grep.fish
	touch "${TERMUX_PREFIX}"/share/zsh/site-functions/_ast-grep
}

termux_step_create_debscripts() {
	cat <<-EOF >./postinst
		#!${TERMUX_PREFIX}/bin/sh

		ast-grep completions bash > ${TERMUX_PREFIX}/share/bash-completion/completions/ast-grep
		ast-grep completions elvish > ${TERMUX_PREFIX}/share/elvish/lib/ast-grep.elv
		ast-grep completions fish > ${TERMUX_PREFIX}/share/fish/vendor_completions.d/ast-grep.fish
		ast-grep completions zsh > ${TERMUX_PREFIX}/share/zsh/site-functions/_ast-grep
	EOF
	if [ "$TERMUX_PACKAGE_FORMAT" = "pacman" ]; then
		echo "post_install" > postupg
	fi
}
