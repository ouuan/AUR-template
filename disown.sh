#!/bin/bash

set -eo pipefail

if [[ -n "$1" ]]; then
    pkgname="$1"
else
    read -rp "pkgname? " pkgname
fi

git rm -r "$pkgname"
git commit -m "disown: $pkgname" --edit
git push
