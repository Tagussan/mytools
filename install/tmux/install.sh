#!/bin/bash
set eu
cd `dirname $0`

TMUX_VERSION="3.2a"
LIBEVENT_VERSION="2.1.11"
NCURSES_VERSION="6.2"


[ -e temp ] && rm -rf temp

mkdir temp
cd temp
wget https://github.com/tmux/tmux/releases/download/$TMUX_VERSION/tmux-$TMUX_VERSION.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-$LIBEVENT_VERSION-stable/libevent-$LIBEVENT_VERSION-stable.tar.gz
wget http://ftp.gnu.org/gnu/ncurses/ncurses-${NCURSES_VERSION}.tar.gz

mkdir local
LOCAL=`pwd`/local
echo $LOCAL

#libevent
tar -xvzf libevent-${LIBEVENT_VERSION}-stable.tar.gz
cd libevent-${LIBEVENT_VERSION}-stable
./configure --prefix=$LOCAL --disable-shared
make
make install
cd ..

#ncurses
tar -xvzf ncurses-${NCURSES_VERSION}.tar.gz
cd ncurses-${NCURSES_VERSION}
./configure --prefix=$LOCAL --with-default-terminfo-dir=/usr/share/terminfo --with-terminfo-dirs="/etc/terminfo:/usr/share/terminfo"
make
make install
cd ..

tar -xvf tmux-$TMUX_VERSION.tar.gz
mv tmux-${TMUX_VERSION} build
cd build
./configure --prefix=$LOCAL --enable-static CFLAGS="-I$LOCAL/include -I$LOCAL/include/ncurses" LDFLAGS="-L$LOCAL/lib -L$LOCAL/include/ncurses -L$LOCAL/include" LIBEVENT_CFLAGS="-I$LOCAL/include" LIBEVENT_LIBS="-L$LOCAL/lib -levent"
make
