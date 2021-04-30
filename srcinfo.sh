#!/bin/bash

for package in */; do
    cd "$package"
    makepkg --printsrcinfo >.SRCINFO
    cd ..
done
