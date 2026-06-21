#!/usr/bin/env bash
# 打包 Linux AppImage(完整:引擎 + 字型 + 譯文 + 原版資料)。
# 含版權遊戲資料 -> 輸出到 release/(gitignore),僅供本地/自備正版者使用。
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

[ -f "$ROOT/build/src/1oom_classic_sdl2" ] || { echo "先 scripts/build.sh"; exit 1; }
[ -f "$ROOT/assets/fonts/cjk24.bin" ] || { echo "先 scripts/build-font.sh"; exit 1; }
ls "$ROOT"/assets/game/*.lbx >/dev/null 2>&1 || { echo "缺原版資料 assets/game/*.lbx"; exit 1; }

docker run --rm -v "$ROOT:/work" -w /work moo-cht-build bash -euc '
  apt-get update -qq >/dev/null 2>&1
  apt-get install -y -qq wget file libfuse2 patchelf timgm6mb-soundfont >/dev/null 2>&1 || apt-get install -y -qq wget file patchelf timgm6mb-soundfont >/dev/null 2>&1
  AT=/tmp/appimagetool
  if [ ! -x "$AT" ]; then
    wget -qO "$AT" "https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage" || \
    wget -qO "$AT" "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
    chmod +x "$AT"
  fi
  AD=/tmp/AppDir
  rm -rf "$AD"; mkdir -p "$AD/usr/bin" "$AD/usr/lib" "$AD/usr/share/moo-cht/data/translation"
  cp /work/build/src/1oom_classic_sdl2 "$AD/usr/bin/"
  # 蒐集非系統共用庫(SDL2 + 音訊 codec 等);系統/桌面整合庫留給目標主機。
  for lib in $(ldd "$AD/usr/bin/1oom_classic_sdl2" | awk "/=>/{print \$3}"); do
    case "$lib" in
      */libc.so*|*/libm.so*|*/libpthread*|*/libdl*|*/librt*|*/ld-linux*|*/libGL*|*/libGLX*|*/libX11*|*/libxcb*|*/libstdc++*|*/libgcc*) ;;  # 系統/GL/X 留給目標
      # ★ 音訊 daemon 連線庫:bundled 版本/plugin 路徑會與主機 PulseAudio/ALSA 不合 -> 沒聲音。
      #   一律留給主機提供,SDL2 執行時 dlopen 主機版本才連得上音訊裝置。
      */libpulse*|*/libasound*|*/libasyncns*|*/libjack*|*/libdbus*|*/libsystemd*) ;;
      *) cp -L "$lib" "$AD/usr/lib/" 2>/dev/null || true ;;
    esac
  done
  # 資料(遊戲 + 字型 + 譯文)
  cp /work/assets/game/* "$AD/usr/share/moo-cht/data/" 2>/dev/null
  cp /work/assets/fonts/cjk24.bin "$AD/usr/share/moo-cht/data/"
  cp /work/docs/translation/*_zh.tsv "$AD/usr/share/moo-cht/data/translation/"
  # MOO1 音樂是 XMIDI(MIDI),SDL2_mixer 需 SoundFont 合成音色;打包小型 GM SoundFont。
  cp /usr/share/sounds/sf2/TimGM6mb.sf2 "$AD/usr/share/moo-cht/" 2>/dev/null || echo "warn: 無 TimGM6mb.sf2(音樂可能靜音)"
  # AppRun
  cat > "$AD/AppRun" <<EOF
#!/bin/sh
HERE="\$(dirname "\$(readlink -f "\$0")")"
export LD_LIBRARY_PATH="\$HERE/usr/lib:\$LD_LIBRARY_PATH"
# MIDI 音樂用 SoundFont:SDL2_mixer+fluidsynth 只認 -sdlmixersf(Mix_SetSoundFonts),
# 不讀 SDL_SOUNDFONTS。用包內附的小型 GM SoundFont,主機沒裝也有音樂。
SF=""
[ -f "\$HERE/usr/share/moo-cht/TimGM6mb.sf2" ] && SF="-sdlmixersf \$HERE/usr/share/moo-cht/TimGM6mb.sf2"
exec "\$HERE/usr/bin/1oom_classic_sdl2" -data "\$HERE/usr/share/moo-cht/data" \$SF -winw 960 -winh 600 "\$@"
EOF
  chmod +x "$AD/AppRun"
  # .desktop + icon(簡單橘底 P)
  cat > "$AD/moo-cht.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Master of Orion CHT
Exec=AppRun
Icon=moo-cht
Categories=Game;
EOF
  printf "P3\n16 16\n255\n" > /tmp/i.ppm
  for y in $(seq 0 15); do for x in $(seq 0 15); do echo "200 90 20"; done; done >> /tmp/i.ppm
  convert /tmp/i.ppm "$AD/moo-cht.png" 2>/dev/null || cp /tmp/i.ppm "$AD/moo-cht.png"
  mkdir -p /work/release
  ARCH=x86_64 "$AT" --appimage-extract-and-run "$AD" /work/release/MasterOfOrion-CHT-x86_64.AppImage >/tmp/ai.log 2>&1 || { tail -20 /tmp/ai.log; exit 1; }
  ls -la /work/release/*.AppImage
'
echo "[build-appimage] -> release/MasterOfOrion-CHT-x86_64.AppImage"
