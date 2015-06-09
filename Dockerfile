
FROM alpine:latest

MAINTAINER Justin Cormack

env PATH=/usr/pkg/bin:$PATH

RUN \
  apk update && \
  apk upgrade && \
  apk add \
  build-base \
  gawk \
  sed \
  zlib-dev \
  openssl-dev \
  ncurses-dev \
  file \
  wget \
  && \
  wget -q http://ftp.ipv6.uni-leipzig.de/pub/ftp.netbsd.org/pub/pkgsrc/current/pkgsrc.tgz && \
  tar -xzf pkgsrc.tgz -C /usr && \
  cd /usr/pkgsrc/bootstrap && CFLAGS="-Wno-deprecated-declarations -fno-builtin" ./bootstrap
