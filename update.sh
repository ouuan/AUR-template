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

if [[ "$2" == "" ]]; then
    echo "Old version: $pkgver"
    read -rp "New version? " ver
else
    ver="$2"
fi

if [[ "$ver" == "$pkgver" ]]; then
    rel=$(("$pkgrel" + 1))
else
    rel=1
fi

sed -i "s/pkgver=[0-9\.]\+/pkgver=$ver/" PKGBUILD
sed -i "s/pkgrel=[0-9\.]\+/pkgrel=$rel/" PKGBUILD
checksums="$(makepkg -g)"
perl -i -p0e "s/sha256sums=\(['0-9a-z \n]+\)/$checksums/" PKGBUILD
makepkg --printsrcinfo >.SRCINFO

rm -r src || true
git clean -dxn
confirm
git clean -dxf

git add -A
git diff --cached
confirm

git commit -am "$pkg: update to $ver-$rel"
git push
