#!/usr/bin/env bash
# 錄製中文化 demo:Xvfb + ffmpeg x11grab,xdotool 巡覽各畫面,轉優化 GIF。
# 產出 docs/img/demo.gif(README 展示用)。
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

docker run --rm -v "$ROOT:/work" -w /work moo-cht-build bash -euc '
  apt-get update -qq >/dev/null 2>&1 && apt-get install -y -qq xdotool ffmpeg >/dev/null 2>&1
  export HOME=/tmp DISPLAY=:99 MOO_CJK_FONT=/work/assets/fonts/cjk24.bin MOO_STR_TR=/work/docs/translation
  rm -rf /tmp/.config; mkdir -p /tmp/.config
  # 960x600 視窗置中於 960x600 螢幕 -> 全幅錄製
  Xvfb :99 -screen 0 960x600x24 >/tmp/xvfb.log 2>&1 &
  sleep 2
  ./build/src/1oom_classic_sdl2 -data /work/assets/game -noaudio -winw 960 -winh 600 -load /work/assets/game/save1.gam >/dev/null 2>&1 &
  GPID=$!
  sleep 4; WID=$(xdotool search --name "1oom" | head -1)
  xdotool windowmove "$WID" 0 0 2>/dev/null || true
  sleep 1
  # 開始錄影(15fps)
  ffmpeg -y -f x11grab -video_size 960x600 -framerate 15 -i :99 -t 26 /tmp/demo.mp4 >/tmp/ff.log 2>&1 &
  FFPID=$!
  k(){ xdotool key --window "$WID" "$1"; }
  c(){ xdotool mousemove --window "$WID" "$1" "$2"; sleep 0.3; xdotool click 1; }
  sleep 1
  k t; sleep 3                       # 研究畫面(科技名+描述中文)
  k Escape; sleep 0.5
  k r; sleep 2                       # 種族/外交關係
  c 735 540; sleep 0.8; c 545 105; sleep 0.8; k Return; sleep 2.5   # 外交會談
  k Escape; sleep 0.5; k Escape; sleep 0.5
  k d; sleep 3                       # 艦船設計
  k Escape; sleep 1                  # 回星圖
  wait $FFPID 2>/dev/null || true
  kill $GPID 2>/dev/null || true
  echo "=== 轉 GIF(palette 優化,scale 640)==="
  ffmpeg -y -i /tmp/demo.mp4 -vf "fps=12,scale=640:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" /work/docs/img/demo.gif >/tmp/gif.log 2>&1
  ls -la /work/docs/img/demo.gif
'
echo "[record-demo] -> docs/img/demo.gif"
