#!/bin/bash
set eu
cd `dirname $0`

VERSION=3.2a

[ -e temp ] && rm -rf temp

mkdir temp
cd temp
wget https://github.com/tmux/tmux/releases/download/$VERSION/tmux-$VERSION.tar.gz

tar -xvf tmux-$VERSION.tar.gz
mv tmux-$VERSION build

cd build
./configure
make
