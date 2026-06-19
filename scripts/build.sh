#!/usr/bin/env bash
# 在 docker 容器內 build 1oom(fork1oom)。
# 用法:scripts/build.sh        # build 全部 SDL2 目標
#       於 repo root 執行;需先 scripts/fetch-engine.sh 取得 1oom/。
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
IMAGE="moo-cht-build"
ENGINE="$ROOT/1oom"
BUILD="$ROOT/build"

[ -d "$ENGINE/src" ] || { echo "缺 1oom/,請先跑 scripts/fetch-engine.sh"; exit 1; }

echo "[build] docker build image: $IMAGE"
docker build -t "$IMAGE" "$ROOT/docker"

mkdir -p "$BUILD"
echo "[build] 在容器內 autoreconf + configure + make"
docker run --rm -v "$ROOT:/work" -w /work "$IMAGE" bash -euc '
  cd 1oom
  [ -f configure ] || autoreconf -fi
  cd /work/build
  [ -f Makefile ] || ../1oom/configure --disable-hwalleg4
  make -j"$(nproc)"
  echo "=== build 產物 ==="
  ls -1 src/1oom_* 2>/dev/null || true
'
echo "[build] 完成。binaries 在 $BUILD/src/"
