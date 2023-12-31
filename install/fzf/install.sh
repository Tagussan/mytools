#!/bin/bash
set eu
cd `dirname $0`

VERSION=0.44.1

[ -e temp ] && rm -rf temp

mkdir temp
cd temp
wget https://github.com/junegunn/fzf/releases/download/$VERSION/fzf-$VERSION-linux_amd64.tar.gz

tar -xvf fzf-$VERSION-linux_amd64.tar.gz
chmod u+x fzf
