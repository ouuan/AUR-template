#!/bin/bash

set -eo pipefail

confirm() {
    read -rp "Continue? [y/N] " reply
    case "$reply" in
    [yY][eE][sS] | [yY]) true ;;
    *) false ;;
    esac
}

if [[ "$1" == "" ]]; then
    pkg=$(exa -D | fzf --prompt "pkgname to init > " --preview="bat --color=always {}/PKGBUILD")
else
    pkg="$1"
fi

git add "$pkg"

cd "$pkg"

source PKGBUILD

updpkgsums

rm -r src || true
git clean -dxn
confirm
git clean -dxf

git add -A
git diff --cached
confirm

git commit -am "$pkg: init at $pkgver" --edit
git push
