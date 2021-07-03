#!/bin/bash
set eu
cd `dirname $0`

VERSION=5.8

[ -e temp ] && rm -rf temp

mkdir temp
cd temp
wget https://www.zsh.org/pub/zsh-$VERSION.tar.xz

tar -xvf zsh-$VERSION.tar.xz
mv zsh-$VERSION build

cd build
./configure
make
