# 1oom (fork1oom) 繁中化建置環境
# 用途:在容器內 build 1oom_classic_sdl2 等目標,不污染系統。
FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        autoconf automake libtool pkg-config \
        libsdl2-dev libsdl2-mixer-dev \
        libsamplerate-dev \
        libgl1-mesa-dev \
        ca-certificates \
        git \
        # headless 跑圖 + 截圖驗證用
        xvfb x11-utils imagemagick \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
CMD ["/bin/bash"]
