FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y build-essential nano ncurses-dev
RUN apt-get install -y git


ENV ARCH=amd64
RUN git clone --depth 1 --branch feat/build-with-docker https://github.com/cusspvz/linux-amlogic /opt/linux-amlogic
WORKDIR /opt/linux-amlogic
RUN make defconfig



# In order to use this image for building the kernel, you need to execute the following command from the root of this repo:
# docker build -t testing . && docker run --rm -ti testing /bin/bash
#
# then you'll be presented with a bash and will be able to build specific moduels
#
# example: make V=1 sm1_s905x3_2g.dtb