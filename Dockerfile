FROM ubuntu:17.10

MAINTAINER  siguernstore@protonmail.com

RUN apt-get update && apt-get install -y \
	build-essential libssl-dev libboost-system-dev libboost-all-dev git libminiupnpc-dev wget

RUN wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz && \
    tar -xzvf db-4.8.30.NC.tar.gz && \
    cd db-4.8.30.NC/build_unix && \
    ../dist/configure --enable-cxx --prefix=/usr && \
    make -j2 && make install

RUN cd /tmp && wget https://magnetwork.io/Wallets/magnet-qt-LINUX.tar.gz && \
    tar xvzf *tar.gz && \
    mv magnetd /root && \
    rm -rf ubuntu* *qt*


WORKDIR "/root"

VOLUME ["/root/.magnet"]


ENTRYPOINT ["/root/magnetd"]

