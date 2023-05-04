FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'root:docker123' | chpasswd
RUN sed -i 's@archive.ubuntu.com@mirror.kakao.com@g' /etc/apt/sources.list
RUN apt update && \
    apt install -y --no-install-recommends software-properties-common \
    sudo vim curl git

WORKDIR /back
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN apt update && \
    apt install -y nodejs
RUN npm install -g npm@9.6.6
RUN npm i -g yarn
RUN npm i -g @nestjs/cli@9.3.0

RUN adduser --disabled-password --gecos "" scv

ENTRYPOINT bash
