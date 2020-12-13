FROM golang:1.15 as builder
ARG TARGETOS
ARG TARGETARCH
WORKDIR /go/src/github.com/rossbachp/multiarch-example
COPY hello-world.go .
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o hello-world .

# starting second stage
FROM alpine:3.12
ARG BUILD-DATE
LABEL org.opencontainers.image.authors="Peter Rossbach"
LABEL org.opencontainers.image.source=https://github.com/rosspbachp/multiarch-example.git
LABEL org.opencontainers.image.licenses=Apache-2.0
# copy the binary from the `build-stage`
COPY --from=builder /go/src/github.com/rossbachp/multiarch-example/hello-world /bin
CMD /bin/hello-world
LABEL org.opencontainers.image.created=${BUILD-DATE}
