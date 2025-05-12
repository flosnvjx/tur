TERMUX_PKG_HOMEPAGE=https://rclone.org/
TERMUX_PKG_DESCRIPTION="rsync for cloud storage"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@flosnvjx"
_COMMIT_DATEREV=20250119
_COMMIT=393b9c1b06f0ccd070accaff9364784860933f5d
TERMUX_PKG_VERSION="1.65.0.git$_COMMIT_DATEREV"
TERMUX_PKG_SRCURL=git+https://github.com/gaoyb7/rclone
TERMUX_PKG_GIT_BRANCH=feat-115-drive
TERMUX_PKG_SHA256=SKIP_CHECKSUM

termux_step_post_get_source() {
	git fetch --unshallow

	local testCommitDateRev="$(TZ=UTC git log --date=format:%Y%m%d --format=%cd | uniq -c | awk '{if ($1>1) {print ($2 ".r" ($1-1));} else print $2; exit;}'
)"

	if [ "$_COMMIT_DATEREV" != "$testCommitDateRev" ]; then
		printf "%s\n" "potential outdated \$_COMMIT_DATEREV defined in $TERMUX_PKG_NAME/build.sh ($_SUBTREE_COMMIT_DATEREV)" > /dev/stderr
	fi

	git checkout "$_COMMIT"
}

termux_step_make_install() {
	cd $TERMUX_PKG_SRCDIR

	termux_setup_golang

	mkdir -p .gopath/src/github.com/rclone
	ln -sf "$PWD" .gopath/src/github.com/rclone/rclone
	export GOPATH="$PWD/.gopath"

	go build -v -ldflags "-X github.com/rclone/rclone/fs.Version=v${TERMUX_PKG_VERSION}-termux" -tags noselfupdate -o rclone

	# XXX: Fix read-only files which prevents removal of src dir.
	chmod u+w -R .

	cp rclone $TERMUX_PREFIX/bin/rclone

	mkdir -p $TERMUX_PREFIX/share/man/man1/
	cp rclone.1 $TERMUX_PREFIX/share/man/man1/
}
