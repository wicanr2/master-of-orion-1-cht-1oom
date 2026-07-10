#!/usr/bin/env bash
# 取得 1oom 引擎(fork1oom)到本機 1oom/ 參考目錄。
# 本 repo 只放 patch,引擎本體不入庫;以此腳本重建環境。
#
# ★ 釘死 commit:上游 master-vanilla-testing 是「移動中的測試分支」,2026-07-05 曾被
#   force-push 重寫歷史(vgabuf 重構、vgabuf_get_xy/draw_filled_rect 改名等),打爛所有
#   patch。patch 皆對 ENGINE_COMMIT 產生並驗證,故一律 checkout 該 commit,不追分支頭。
#   升級引擎時:改 ENGINE_COMMIT → 重跑 rebase/驗證 → 更新 patch/。
set -euo pipefail

ENGINE_URL="https://git@git.sourcecraft.dev/fork1oom/1oom.git"
ENGINE_BRANCH="master-vanilla-testing"
ENGINE_COMMIT="8a7b21ae40f57d82f30d33ee04e7836e037209c7"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$ROOT/1oom"

if [ -d "$DEST/.git" ]; then
  echo "[fetch-engine] 已存在 $DEST,fetch 後 checkout 釘死 commit"
  git -C "$DEST" fetch origin "$ENGINE_BRANCH"
  git -C "$DEST" checkout "$ENGINE_COMMIT"
else
  echo "[fetch-engine] clone $ENGINE_URL -> $DEST,checkout $ENGINE_COMMIT"
  git clone --branch "$ENGINE_BRANCH" "$ENGINE_URL" "$DEST"
  git -C "$DEST" checkout "$ENGINE_COMMIT"
fi
echo "[fetch-engine] 完成。引擎位於 $DEST @ $ENGINE_COMMIT(已被 .gitignore 排除)。"
