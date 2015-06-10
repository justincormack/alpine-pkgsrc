FROM alpine:latest

MAINTAINER Justin Cormack <justin@specialbusservice.com>

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
  git \
  rsync \
  m4

ENV \
  PATH=/usr/pkg/bin:$PATH \
  NOGCCERROR=yes \
  PKG_DEFAULT_OPTIONS="-gssapi"

RUN \
  wget -q http://ftp.ipv6.uni-leipzig.de/pub/ftp.netbsd.org/pub/pkgsrc/current/pkgsrc.tgz && \
  tar -xzf pkgsrc.tgz -C /usr && \
  cd /usr/pkgsrc/bootstrap && ./bootstrap

COPY mk.conf /usr/pkg/etc/
