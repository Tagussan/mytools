#!/bin/bash
set eu
cd `dirname $0`

VERSION=14.0.3

[ -e temp ] && rm -rf temp

mkdir temp
cd temp
wget https://github.com/BurntSushi/ripgrep/releases/download/$VERSION/ripgrep-$VERSION-x86_64-unknown-linux-musl.tar.gz

tar -xvf ripgrep-$VERSION-x86_64-unknown-linux-musl.tar.gz
mv ripgrep-$VERSION-x86_64-unknown-linux-musl build

cd build
chmod u+x rg
