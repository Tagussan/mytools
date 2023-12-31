#!/bin/bash
set eu
cd `dirname $0`

VERSION=v8.7.1

[ -e temp ] && rm -rf temp

mkdir temp
cd temp
wget https://github.com/sharkdp/fd/releases/download/$VERSION/fd-$VERSION-x86_64-unknown-linux-gnu.tar.gz

tar -xvf fd-$VERSION-x86_64-unknown-linux-gnu.tar.gz
mv fd-$VERSION-x86_64-unknown-linux-gnu build

cd build
chmod u+x fd
