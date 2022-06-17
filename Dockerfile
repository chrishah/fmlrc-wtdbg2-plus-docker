FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN apt-get update && \
	apt-get install -y \
		build-essential \
		git \
		zlib1g-dev \
		cmake \
		samtools \
		cargo \
		rustc 

WORKDIR /usr/src

#download and install ropebwt2 (commit 1.2.2021)
RUN git clone https://github.com/lh3/ropebwt2.git && \
	cd ropebwt2 && \
	git reset --hard bd8dbd3db2e9e3cff74acc2907c0742c9ebbf033 && \
	make && \
	ln -s $(pwd)/ropebwt2 /usr/bin/

#download and install wtdbg2
RUN git clone https://github.com/ruanjue/wtdbg2 && \
	cd wtdbg2 && \
	git checkout v2.5 && \
	make

#install minimap2
RUN git clone https://github.com/lh3/minimap2.git && \
	cd minimap2/ && \
	git checkout v2.24 && \
	make && \
	ln -s $(pwd)/minimap2 /usr/bin/

#install bwa
RUN git clone https://github.com/lh3/bwa.git && \
	cd bwa \
	git checkout v0.7.17 && \
	make && \
	ln -s $(pwd)/bwa /usr/bin/

#download and install fmlrc
RUN cargo install fmlrc --version 0.1.7

ENV PATH="/root/.cargo/bin:/usr/src/wtdbg2/:$PATH"

