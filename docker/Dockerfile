FROM --platform=linux/amd64 ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    vim \
    git \
    wget \
    curl \
    build-essential \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    zsh flex bison gdb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/csapp3e-labs

CMD ["zsh"]