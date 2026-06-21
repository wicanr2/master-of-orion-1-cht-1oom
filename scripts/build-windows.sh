#!/usr/bin/env bash
# 交叉編譯 Windows 64-bit(mingw-w64 + SDL2 mingw),打包完整 zip(含 DLL + 遊戲 + 字型 + 譯文)。
# 含版權遊戲資料 -> 輸出 release/(gitignore)。
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
[ -d "$ROOT/1oom/src" ] || { echo "缺 1oom/(scripts/fetch-engine.sh)"; exit 1; }
[ -f "$ROOT/assets/fonts/cjk24.bin" ] || { echo "先 scripts/build-font.sh"; exit 1; }

docker run --rm -v "$ROOT:/work" -w /work debian:bookworm-slim bash -euc '
  export DEBIAN_FRONTEND=noninteractive
  apt-get update -qq >/dev/null
  apt-get install -y -qq mingw-w64 autoconf automake libtool pkg-config make wget ca-certificates xz-utils zip timgm6mb-soundfont >/dev/null
  H=x86_64-w64-mingw32
  DEPS=/tmp/deps; mkdir -p $DEPS; cd $DEPS
  SDLV=2.28.5; MIXV=2.6.3
  wget -q "https://github.com/libsdl-org/SDL/releases/download/release-$SDLV/SDL2-devel-$SDLV-mingw.tar.gz"
  wget -q "https://github.com/libsdl-org/SDL_mixer/releases/download/release-$MIXV/SDL2_mixer-devel-$MIXV-mingw.tar.gz"
  tar xf SDL2-devel-$SDLV-mingw.tar.gz; tar xf SDL2_mixer-devel-$MIXV-mingw.tar.gz
  SDL=$DEPS/SDL2-$SDLV/$H; MIX=$DEPS/SDL2_mixer-$MIXV/$H
  # 合併 sdl2-config 路徑
  export PKG_CONFIG_PATH="$SDL/lib/pkgconfig:$MIX/lib/pkgconfig"
  cd /work/1oom; [ -f configure ] || autoreconf -fi >/dev/null 2>&1
  rm -rf /work/build-win; mkdir -p /work/build-win; cd /work/build-win
  # configure 的 SDL2_mixer 偵測用 #include "SDL2/SDL_mixer.h" -> 需 -I$MIX/include
  #   (非 .../include/SDL2);且連結 Mix_LoadMUS 需 SDL2_mixer 在 SDL2 之前才解得了符號。
  #   漏這兩點 -> HAVE_SDL2MIXER 沒定義 -> 沒音訊、-sdlmixersf 變 unknown option。
  ../1oom/configure --host=$H --without-samplerate --disable-hwsdl1 --disable-hwalleg4 --disable-tools \
    CFLAGS="-g -O2 -I$SDL/include -I$SDL/include/SDL2 -I$MIX/include -I$MIX/include/SDL2" \
    SDL2_CFLAGS="-I$SDL/include -I$SDL/include/SDL2" \
    SDL2_LIBS="-L$SDL/lib -lmingw32 -lSDL2main -lSDL2" \
    SDL2MIXER_LIBS="-L$MIX/lib -lSDL2_mixer -L$SDL/lib -lSDL2" \
    LDFLAGS="-L$SDL/lib -L$MIX/lib" >/tmp/conf.log 2>&1 || { tail -25 /tmp/conf.log; exit 1; }
  echo "SDL2_mixer 偵測:$(grep -i "SDL2_mixer library" /tmp/conf.log | tail -1)"
  grep -q "HAVE_SDL2MIXER" config.h 2>/dev/null && echo "  -> HAVE_SDL2MIXER 已定義 ✓(有音訊)" || echo "  -> ⚠️ HAVE_SDL2MIXER 未定義(無音訊)"
  make -j"$(nproc)" >/tmp/make.log 2>&1 || { grep -iE "error" /tmp/make.log | head; exit 1; }
  EXE=$(find . -name "1oom_classic_sdl2.exe" | head -1)
  [ -n "$EXE" ] || { echo "未產生 exe"; grep -iE "error|warning: .*main" /tmp/make.log | tail; exit 1; }
  # 打包
  OUT=/tmp/MasterOfOrion-CHT-win64; rm -rf "$OUT"; mkdir -p "$OUT/data/translation"
  cp "$EXE" "$OUT/MasterOfOrion-CHT.exe"
  cp "$SDL/bin/SDL2.dll" "$OUT/"
  cp "$MIX/bin/"*.dll "$OUT/" 2>/dev/null || true
  # mingw runtime DLL
  for d in libwinpthread-1.dll libgcc_s_seh-1.dll libstdc++-6.dll; do
    f=$(find /usr/lib/gcc/$H /usr/$H -name "$d" 2>/dev/null | head -1); [ -n "$f" ] && cp "$f" "$OUT/" || true
  done
  cp /work/assets/game/* "$OUT/data/" 2>/dev/null
  cp /work/assets/fonts/cjk24.bin "$OUT/data/"
  cp /work/docs/translation/*_zh.tsv "$OUT/data/translation/"
  # MIDI 音樂 SoundFont(原生 Windows MIDI 時為 no-op;timidity/fluidsynth 時補音色)
  cp /usr/share/sounds/sf2/TimGM6mb.sf2 "$OUT/data/" 2>/dev/null || echo "warn: 無 TimGM6mb.sf2"
  cat > "$OUT/玩.bat" <<EOF
@echo off
"%~dp0MasterOfOrion-CHT.exe" -data "%~dp0data" -sdlmixersf "%~dp0data\TimGM6mb.sf2" -winw 960 -winh 600
EOF
  mkdir -p /work/release
  (cd /tmp && zip -qr /work/release/MasterOfOrion-CHT-win64.zip MasterOfOrion-CHT-win64)
  ls -la /work/release/MasterOfOrion-CHT-win64.zip
  echo "DLLs:"; ls "$OUT"/*.dll
'
echo "[build-windows] -> release/MasterOfOrion-CHT-win64.zip"
