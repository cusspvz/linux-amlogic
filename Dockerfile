FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y build-essential nano ncurses-dev


ENV ARCH=amd64
WORKDIR /opt/linux-amlogic
ADD . /opt/linux-amlogic

RUN make defconfig
