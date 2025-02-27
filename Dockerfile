FROM ubuntu:24.04

ARG USERNAME=dockeruser

# update and install packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y
RUN apt install -y g++ clang libc++-dev libc++abi-dev cmake ninja-build libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libfontconfig1-dev git wget unzip
ENV DEBIAN_FRONTEND=

WORKDIR /root

# get skia
RUN wget https://github.com/aseprite/skia/releases/download/m102-861e4743af/Skia-Linux-Release-x64-libstdc++.zip
RUN unzip Skia-Linux-Release-x64-libstdc++.zip -d /root/skia

# build aseprite
RUN git clone --recursive --depth 1 --single-branch https://github.com/aseprite/aseprite.git aseprite
WORKDIR /root/aseprite/build
RUN cmake -G Ninja \
    -DLAF_BACKEND=skia \
    -DSKIA_DIR=/root/skia \
    -DSKIA_LIBRARY_DIR=/root/skia/out/Release-x64 \
    ..
RUN ninja
RUN ./bin/aseprite --version

ENV PATH="/root/aseprite/build/bin:$PATH"

WORKDIR /root

# set entrypoint for action
COPY entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]
