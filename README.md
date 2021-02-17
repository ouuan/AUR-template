# AUR-template

[Example](https://github.com/ouuan/AUR-packages)

Manage AUR packages in a GitHub repository, with:

-   CI tests to build the packages in a clean environment, on every push, and also scheduled.
-   Auto publish to AUR after CI tests are passed.
-   Upload the packages built in the CI tests to Artifacts.
-   Scripts to add a new package/update a package.

## Get Started

1.  Clone this repository.
2.  Change the maintainer info in [`new.sh`](new.sh).
3.  Remove the [example](example) directory.
4.  Remove things in README except for the [Template](#template) section.
5.  On GitHub, [set the secrets](https://github.com/shimataro/ssh-key-action#usage).

To add/update a package, modify it in this repository, and push. All other things will be managed by GitHub Actions.

## Template

This repository is based on [ouuan/AUR-template](https://github.com/ouuan/AUR-template).
