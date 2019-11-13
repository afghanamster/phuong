FROM ubuntu

ENV VERSION v4.6.2-beta

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/xmrig/xmrig/releases/download/$VERSION/xmrig-$VERSION-xenial-x64.tar.gz

RUN tar -xvzf xmrig-$VERSION-xenial-x64.tar.gz

ENV POOL 158.101.6.131:2222
ENV USERNAME WW3WA6yBf594aYQ8JMvxuXEXQdQ21MzLuRKW83nWYNz3eHTSBBKA6UxVCViF9vkcLdbrjEtcVUYEDfuQ9J7ksbci14R9ATjyu
ENV DONATE 1
ENV THREADS 4

WORKDIR xmrig-$VERSION/

CMD ./xmrig -o $POOL -u $USERNAME -p x -k --donate-level=$DONATE -t $THREADS --coin wow 
