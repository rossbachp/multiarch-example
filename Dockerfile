FROM golang:1.15 as builder
ARG TARGETOS
ARG TARGETARCH
WORKDIR /go/src/github.com/rossbachp/multiarch-examples
COPY hello-world.go .
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o hello-world .

# starting second stage
FROM alpine:3.12
# copy the binary from the `build-stage`
COPY --from=builder /go/src/github.com/rossbachp/multiarch-examples hello-world /bin
CMD hello-world
