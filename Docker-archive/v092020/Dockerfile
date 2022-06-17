FROM ubuntu:18.04

RUN apt-get update && \
	apt-get install -y \
		git=1:2.17.1-1ubuntu0.7 \
		build-essential=12.4ubuntu1 \
		zlib1g-dev=1:1.2.11.dfsg-0ubuntu2 \
		cmake=3.10.2-1ubuntu2.18.04.1 \
		python-pip=9.0.1-2.3~ubuntu1.18.04.2 \
		samtools=1.7-1

WORKDIR /usr/src

#install msbwt
RUN pip install numpy==1.16.6 && \
	pip install msbwt==0.3.0

#download and install ropebwt2 (commit 1.10.2018)
RUN git clone https://github.com/lh3/ropebwt2.git && \
	cd ropebwt2 && \
	git reset --hard a1e20c968f19652c607093f309acb7b858e334e4 && \
	make && \
	ln -s $(pwd)/ropebwt2 /usr/bin/

#download and install fmlrc
RUN git clone https://github.com/holtjma/fmlrc && \
	cd fmlrc && \
	git checkout v1.0.0 && \
	make

#download and install wtdbg2
RUN git clone https://github.com/ruanjue/wtdbg2 && \
	cd wtdbg2 && \
	git checkout v2.5 && \
	make

#install minimap2
RUN git clone https://github.com/lh3/minimap2.git && \
	cd minimap2/ && \
	git checkout v2.17 && \
	make && \
	ln -s $(pwd)/minimap2 /usr/bin/

#install bwa
RUN git clone https://github.com/lh3/bwa.git && \
	cd bwa \
	git checkout v0.7.17 && \
	make && \
	ln -s $(pwd)/bwa /usr/bin/

ENV PATH="/usr/src/fmlrc:/usr/src/wtdbg2/:$PATH"

