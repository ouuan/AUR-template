#!/bin/bash

set -eo pipefail

if [[ -n "$1" ]]; then
    pkgname="$1"
else
    read -rp "pkgname? " pkgname
fi

source config
git clone "ssh://aur@aur.archlinux.org/$pkgname.git"
cd "$pkgname"
rm -rf .git .SRCINFO
sed -i "s/# Maintainer/# Contributor/g" PKGBUILD
sed -i "1i# Maintainer: $maintainer" PKGBUILD
