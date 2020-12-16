# Play to build docker multi arch binaries with github actions

![Master Branch CI](https://github.com/rossbachp/multiarch-example/workflows/Master%20Branch%20CI/badge.svg?branch=master) ![Nightly Test](https://github.com/rossbachp/multiarch-example/workflows/Nightly%20Test/badge.svg?branch=master)

Welcome. This is a simple example application to show a common Docker specific GitHub Action setup. We have a Go application that is built and
deployed in Docker containers using Dockerfiles.

This is a fork of https://github.com/metcalfc/docker-action-examples!

## Docker Actions v2

- 🚪 [Docker Login](https://github.com/docker/login-action)
- 🛠 [Setup Buildx](https://github.com/docker/setup-buildx-action)
- 🎭 [Setup Cross Platform Builds](https://github.com/docker/setup-qemu-action)
- 🔨 [Docker Build](https://github.com/docker/build-push-action)

## CI setup

We want to setup CI to test:

- ✒ [Every commit to `master`](https://github.com/rossbachp/multiarch-example/blob/master/.github/workflows/image.yml)
- 🐳 [Releases via tags pushed to Docker Hub.](https://github.com/ossbachp/multiarch-example/blob/master/.github/workflows/release.yml)

## GitHub Container Registry FAQ

### Where does this `secret.GHCR_TOKEN` come from?

The secret isn't automatically populated. The original GitHub Packages container registry did use the automatically generated `GITHUB_TOKEN`. GitHub has said that support for that will be added to this new registry in the future.

<br>

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Support for Actions through GITHUB_TOKEN is coming.</p>&mdash; Bryan Clark (@clarkbw) <a href="https://twitter.com/clarkbw/status/1300853015113396225?ref_src=twsrc%5Etfw">September 1, 2020</a></blockquote>

<br>

For now you will need to create a GitHub Personal Access Token (PAT) which you can do by going here: https://github.com/settings/tokens

You'll need to create the PAT with the correct scopes which you can find here: https://docs.github.com/en/packages/getting-started-with-github-container-registry/migrating-to-github-container-registry-for-docker-images#authenticating-with-the-container-registry

Once you have the PAT you can create an action secret: https://docs.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets

You can call the secret whatever you want. But `GHCR_TOKEN` is what I used for the example above.

### I thought GHCR had anonymous pulls?

Its a beta product so the documentation doesn't really exist yet. If you dig around on
[GitHub's Community site](https://github.community/tag/ghcr) you can find some answers.
Thats a pain so here is what I've found.

`ghcr.io` is private by default. You'll notice in the [nightly.yml](.github/workflows/nightly.yml) I had to do a login to be able to pull the image.

You can see what packages you have by going here (change the username): https://github.com/USERNAME?tab=packages&visibility=private

You can make it public going to the packages settings (change the username and project name): https://github.com/users/USERNAME/packages/container/PROJECTNAME/settings


## Reference

* https://github.com/metcalfc/docker-action-examples
