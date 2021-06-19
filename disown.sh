#!/bin/bash

set -eo pipefail

if [[ -n "$1" ]]; then
    pkgname="$1"
else
    pkgname=$(exa -D | fzf --prompt "pkgname to init > " --preview="bat --color=always {}/PKGBUILD")
    echo "$pkgname"
fi

git rm -r "$pkgname"
git commit -m "disown: $pkgname" --edit
git push
