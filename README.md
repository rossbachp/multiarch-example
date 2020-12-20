# Play arround to build docker multi arch images

![Master Branch CI](https://github.com/rossbachp/multiarch-example/workflows/Create%20Dev%20Image/badge.svg?branch=main) ![Nightly Test](https://github.com/rossbachp/multiarch-example/workflows/Nightly%20Test/badge.svg?branch=main) ![Release](https://github.com/rossbachp/multiarch-example/workflows/Publish%20Releases%20to%20Hub/badge.svg?branch=v1.0.9)

Welcome. This is a simple example application to show a common Docker specific GitHub Action setup. We have a Go application that is built and
deployed in Docker containers using Dockerfiles.

This is project use this useful [Docker action examples](https://github.com/metcalfc/docker-action-examples)!

## Docker Actions v2

- 🚪 [Docker Login](https://github.com/docker/login-action)
- 🛠 [Setup Buildx](https://github.com/docker/setup-buildx-action)
- 🎭 [Setup Cross Platform Builds](https://github.com/docker/setup-qemu-action)
- 🔨 [Docker Build](https://github.com/docker/build-push-action)

## CI setup

We want to setup CI to test:

- ✒ [Every commit to `master`](https://github.com/rossbachp/multiarch-example/blob/master/.github/workflows/image.yml)
- 🌃 [Integration tests nightly](https://github.com/rossbachp/multiarch-example/blob/master/.github/workflows/nightly.yml)
- 🐳 [Releases via tags pushed to Docker Hub.](https://github.com/ossbachp/multiarch-example/blob/master/.github/workflows/release.yml)

## Hack locally

Create a local image with your architecture

```
$ make dev
```

If you don't have install a multi arch image builder, create one:

```
$ make builder
```

Build multiarch without load or push.

```
$ make build
```

Create multiarch and push to docker my account

NOTE: Login to the right hub account!

```
$ make push
```

let the diffenent arch container images run

```
$ make run
```

Trigger the release with

```
$ git tag -a v1.0.3
$ git push origin v1.0.3
```

Regards,

Peter <peter.rossbach@bee42.com>
