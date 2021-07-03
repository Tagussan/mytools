#!/bin/bash
set eu
cd `dirname $0`

VERSION=2.1.12
[ -e temp  ] && rm -rf temp

mkdir temp
cd temp

wget https://github.com/libevent/libevent/releases/download/release-$VERSION-stable/libevent-$VERSION-stable.tar.gz
tar -xvf libevent-$VERSION-stable.tar.gz
mv libevent-$VERSION-stable build

cd build
./configure
make
sudo make install
