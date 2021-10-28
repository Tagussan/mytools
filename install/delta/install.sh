#!/bin/bash
set eu
cd `dirname $0`

VERSION=0.9.1

[ -e temp ] && rm -rf temp

mkdir temp
cd temp
wget https://github.com/dandavison/delta/releases/download/$VERSION/delta-$VERSION-x86_64-unknown-linux-musl.tar.gz

tar -xvf delta-$VERSION-x86_64-unknown-linux-musl.tar.gz
mv delta-$VERSION-x86_64-unknown-linux-musl build

cd build
chmod u+x delta
