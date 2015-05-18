#!/bin/sh

die() {
    echo >&2 "$@"
    exit 1
}

INSTALL_DIR=$(git --exec-path) || die "git --exec-path failed"
test -n "$INSTALL_DIR" || die "Empty install directory"
test -d "$INSTALL_DIR" || die "$INSTALL_DIR is not a directory"

echo "Installing into '$INSTALL_DIR'..."

cp git-push-each "$INSTALL_DIR/" ||
die "Failed to copy git-push-each into '$INSTALL_DIR/'"
