#!/bin/bash

set -eo pipefail

if [[ -n "$1" ]]; then
    pkgname="$1"
else
    read -rp "pkgname? " pkgname
fi

mkdir "$pkgname"

source config

echo "# Maintainer: $maintainer

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
sha256sums=('SKIP')

build() {

}

package() {

}" >"${pkgname}/PKGBUILD"
