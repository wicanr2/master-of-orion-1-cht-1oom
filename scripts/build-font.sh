#!/usr/bin/env bash
# 從已翻譯的 source(及任何譯文文字檔)收集 CJK 碼點,烘 24×24 點陣 atlas。
# docker uv venv + PIL,掛載系統 arphic 字型;不污染系統。
# 產出 assets/fonts/cjk24.bin(入庫資產)+ build/cjk24_preview.png。
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FONT="${MOO_FONT:-/usr/share/fonts/truetype/arphic/uming.ttc}"
SIZE="${MOO_FONT_SIZE:-24}"

# 收集碼點來源:所有含 CJK 的引擎 source(game_str.c + 各 ui 疊字標籤)+ docs 譯文。
mapfile -t SRCS < <(cd "$ROOT" && grep -rlP --include='*.c' --include='*.h' '[^\x00-\x7f]' 1oom/src 2>/dev/null)
[ -d "$ROOT/docs/translation" ] && SRCS+=("docs/translation"/*.txt)
echo "[build-font] 碼點來源檔: ${#SRCS[@]} 個"

docker run --rm \
  -v "$ROOT:/work" -w /work \
  -v "$(dirname "$FONT"):/fonts:ro" \
  ghcr.io/astral-sh/uv:python3.12-bookworm-slim bash -euc "
    uv venv -q /tmp/venv && . /tmp/venv/bin/activate && uv pip install -q pillow
    python3 tools/build_cjk_font.py \
      --font /fonts/$(basename "$FONT") --size $SIZE \
      --text ${SRCS[*]} \
      --out assets/fonts/cjk24.bin \
      --preview build/cjk24_preview.png
  "
echo "[build-font] 完成 -> assets/fonts/cjk24.bin"
