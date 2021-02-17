#!/bin/bash

if [[ -n "$1" ]]; then
    pkgname="$1"
else
    read -rp "pkgname? " pkgname
fi

mkdir "$pkgname"

echo "# Maintainer: Your Name <your email>

pkgname=${pkgname}
pkgver=
pkgrel=1
provides=('')
conflicts=('')
pkgdesc=''
arch=('x86_64')
url=''
license=('')
depends=('')
makedepends=('')
optdepends=('')
source=(\"\")
sha256sums=('')

build() {

}

package() {

}" >"${pkgname}/PKGBUILD"
