FROM ubuntu:16.04

MAINTAINER  siguernstore@protonmail.com

RUN apt-get update && apt-get install -y \
	build-essential libssl-dev libboost-all-dev git libdb5.3++-dev libminiupnpc-dev wget

RUN cd /tmp && wget https://magnetwork.io/Wallets/magnet-qt-LINUX.tar.gz && \
    tar xvzf *tar.gz && \
    mv magnetd /root && \
    rm -rf ubuntu* *qt*


WORKDIR "/root"

VOLUME ["/root/.magnet"]


ENTRYPOINT ["/root/magnetd"]

