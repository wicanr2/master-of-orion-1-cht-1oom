#!/usr/bin/env bash
# 取得 1oom 引擎(fork1oom)到本機 1oom/ 參考目錄。
# 本 repo 只放 patch,引擎本體不入庫;以此腳本重建環境。
set -euo pipefail

ENGINE_URL="https://git@git.sourcecraft.dev/fork1oom/1oom.git"
ENGINE_BRANCH="master-vanilla-testing"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$ROOT/1oom"

if [ -d "$DEST/.git" ]; then
  echo "[fetch-engine] 已存在 $DEST,執行 git fetch/checkout"
  git -C "$DEST" fetch origin "$ENGINE_BRANCH"
  git -C "$DEST" checkout "$ENGINE_BRANCH"
else
  echo "[fetch-engine] clone $ENGINE_URL ($ENGINE_BRANCH) -> $DEST"
  git clone --branch "$ENGINE_BRANCH" "$ENGINE_URL" "$DEST"
fi
echo "[fetch-engine] 完成。引擎位於 $DEST(已被 .gitignore 排除)。"
