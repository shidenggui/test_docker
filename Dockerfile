from ubuntu:16.04

MAINTAINER shidenggui <longlyshidenggui@gmail.com>

# use aliyun soruce
RUN rm /etc/apt/sources.list
RUN && echo deb http://mirrors.163.com/ubuntu/ xenial main restricted universe multiverse >> /etc/apt/sources.list \
    && echo deb http://mirrors.163.com/ubuntu/ xenial-security main restricted universe multiverse >> /etc/apt/sources.list \
    && echo deb http://mirrors.163.com/ubuntu/ xenial-updates main restricted universe multiverse >> /etc/apt/sources.list \
    && echo deb http://mirrors.163.com/ubuntu/ xenial-proposed main restricted universe multiverse >> /etc/apt/sources.list \
    && echo deb http://mirrors.163.com/ubuntu/ xenial-backports main restricted universe multiverse >> /etc/apt/sources.list \
    && echo deb-src http://mirrors.163.com/ubuntu/ xenial main restricted universe multiverse >> /etc/apt/sources.list \
    && echo deb-src http://mirrors.163.com/ubuntu/ xenial-security main restricted universe multiverse >> /etc/apt/sources.list \
    && echo deb-src http://mirrors.163.com/ubuntu/ xenial-updates main restricted universe multiverse >> /etc/apt/sources.list \
    && echo deb-src http://mirrors.163.com/ubuntu/ xenial-proposed main restricted universe multiverse >> /etc/apt/sources.list \
    && echo deb-src http://mirrors.163.com/ubuntu/ xenial-backports main restricted universe multiverse >> /etc/apt/sources.list

# add pythoh conda
RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.0.0-Linux-x86_64.sh && \
    /bin/bash /Anaconda3-4.0.0-Linux-x86_64.sh -b -p /opt/conda && \
    rm /Anaconda3-4.0.0-Linux-x86_64.sh

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

ENV PATH /opt/conda/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

# add golang
RUN apt-get update && apt-get install -y --no-install-recommends \
    && golang
	&& rm -rf /var/lib/apt/lists/*

ENV GOPATH /go

