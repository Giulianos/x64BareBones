FROM golang:1.22 as mp-build
RUN go install github.com/Giulianos/module-packer/cmd/mp@0.0.1

FROM debian:bookworm-slim

COPY --from=mp-build /go/bin/mp /usr/bin/mp

RUN apt update -y
RUN apt install -y \
      gcc \
      nasm \
      make \
      gcc-x86-64-linux-gnu \
      binutils-x86-64-linux-gnu \
      qemu-utils

WORKDIR /src
