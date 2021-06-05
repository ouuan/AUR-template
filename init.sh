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
    echo "Package?"
    select pkg in $(exa -D); do
        break
    done
else
    pkg="$1"
fi

cd "$pkg"

source PKGBUILD

checksums="$(makepkg -g)"
perl -i -p0e "s/sha256sums=\(['0-9a-z \n]+\)/$checksums/" PKGBUILD

git add PKGBUILD

rm -r src || true
git clean -dxn
confirm
git clean -dxf

git add -A
git diff --cached
confirm

git commit -am "$pkg: init at $pkgver"
git push
