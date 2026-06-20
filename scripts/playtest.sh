#!/usr/bin/env bash
# Game tester:載入存檔巡覽各主要畫面,截圖 + 偵測 crash,驗證可玩性與中文化破版。
# 用法:scripts/playtest.sh   (需 build/src/1oom_classic_sdl2、assets/game、cjk24.bin)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/build/playtest"

docker run --rm -v "$ROOT:/work" -w /work moo-cht-build bash -euc '
  apt-get update -qq >/dev/null 2>&1 && apt-get install -y -qq xdotool >/dev/null 2>&1
  export HOME=/tmp DISPLAY=:99 MOO_CJK_FONT=/work/assets/fonts/cjk24.bin MOO_STR_TR=/work/docs/translation
  rm -rf /tmp/.config /work/build/playtest; mkdir -p /tmp/.config /work/build/playtest
  Xvfb :99 -screen 0 1280x800x24 >/tmp/xvfb.log 2>&1 &
  sleep 2
  stdbuf -oL ./build/src/1oom_classic_sdl2 -data /work/assets/game -noaudio -winw 960 -winh 600 \
      -load /work/assets/game/save1.gam >/work/build/playtest/run.log 2>&1 &
  GPID=$!
  k(){ xdotool key --window "$WID" "$1"; }
  shot(){ sleep 1.2; import -window root "/work/build/playtest/$1.png" 2>/dev/null; }
  sleep 4; WID=$(xdotool search --name "1oom" | head -1)
  sleep 1; shot 00_starmap
  # 各主畫面快捷鍵(自星圖):g設定 d設計 f艦隊 m地圖 r種族 p行星 t科技
  for key in t d f r p; do
    k "$key"; shot "scr_$key"
    k Escape; sleep 0.6                 # 返回星圖
  done
  k n; shot 90_nextturn                 # 下一回合
  RUNNING=0; kill -0 $GPID 2>/dev/null && RUNNING=1
  kill $GPID 2>/dev/null || true
  echo "=== PLAYTEST 結果 ==="
  echo "存活: $RUNNING (1=正常結束巡覽)"
  echo "crash 標誌: $(grep -icE "corrupted|abort|segmentation|sanitiz" /work/build/playtest/run.log)"
  echo "截圖:"; ls -la /work/build/playtest/*.png | awk "{print \$5, \$NF}"
'
echo "[playtest] 截圖在 $OUT/"
