# 基础镜像 (amd64 架构的 Ubuntu 20.04)
# 在 docker-compose.yml 中我们会指定平台，这里保持简洁
FROM --platform=linux/amd64 ubuntu:20.04

# 设置非交互式安装，避免安装过程中出现交互提示
ENV DEBIAN_FRONTEND=noninteractive

# 安装一些常用工具和依赖 (根据你的需求可以增减)
# build-essential 包含了 gcc, g++, make 等编译工具
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
    && rm -rf /var/lib/apt/lists/*

# 默认启动 bash shell，以 root 用户身份
CMD ["/bin/bash"]