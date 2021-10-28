#!/bin/bash
set eu
cd `dirname $0`

VERSION=3360000

[ -e temp ] && rm -rf temp

mkdir temp
cd temp
wget https://www.sqlite.org/2021/sqlite-tools-linux-x86-${VERSION}.zip

unzip sqlite-tools-linux-x86-${VERSION}.zip
mv sqlite-tools-linux-x86-${VERSION} build

cd build
chmod u+x sqlite3
