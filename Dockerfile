from ubuntu:16.04

MAINTAINER shidenggui <longlyshidenggui@gmail.com>

# use aliyun soruce
RUN rm /etc/apt/sources.list
COPY sources.list /etc/apt/sources.list

# add pythoh conda
RUN apt-get update && apt upgrade && apt-get install -y wget 
RUN wget --quiet https://repo.continuum.io/archive/Anaconda3-4.0.0-Linux-x86_64.sh && \
    /bin/bash /Anaconda3-4.0.0-Linux-x86_64.sh -b -p /opt/conda && \
    rm /Anaconda3-4.0.0-Linux-x86_64.sh


ENV PATH /opt/conda/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

# add golang
RUN apt-get update && apt-get install -y --no-install-recommends \
    && golang
	&& rm -rf /var/lib/apt/lists/*

ENV GOPATH /go

