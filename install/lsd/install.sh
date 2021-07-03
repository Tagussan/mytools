#!/bin/bash
set eu
cd `dirname $0`

VERSION=0.20.1

[ -e temp ] && rm -rf temp

mkdir temp
cd temp
wget https://github.com/Peltoche/lsd/releases/download/$VERSION/lsd-$VERSION-x86_64-unknown-linux-musl.tar.gz

tar -xvf lsd-$VERSION-x86_64-unknown-linux-musl.tar.gz
mv lsd-$VERSION-x86_64-unknown-linux-musl build

cd build
chmod u+x lsd
