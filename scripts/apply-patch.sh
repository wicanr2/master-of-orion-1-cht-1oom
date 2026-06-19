#!/usr/bin/env bash
# 把 repo 的繁中化 patch 套到本機 1oom/(fork1oom)上。
# 需先 scripts/fetch-engine.sh 取得引擎。
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ENGINE="$ROOT/1oom"

[ -d "$ENGINE/src" ] || { echo "缺 1oom/,請先跑 scripts/fetch-engine.sh"; exit 1; }

for p in "$ROOT"/patch/*.patch; do
  [ -e "$p" ] || continue
  echo "[apply-patch] $p"
  git -C "$ENGINE" apply --whitespace=nowarn "$p"
done
echo "[apply-patch] 完成。接著 scripts/build.sh,並設 MOO_CJK_FONT 指向 atlas 後執行。"
