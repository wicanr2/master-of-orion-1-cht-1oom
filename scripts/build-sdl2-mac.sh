#!/bin/sh
# build-sdl2-mac.sh PREFIX
#
# 從源碼編譯 pinned 真 SDL2 + SDL2_mixer 到 PREFIX(macOS / Linux 通用)。
#
# 為什麼:2026-06 起 `brew install sdl2` 變成 sdl2-compat(SDL2 API 架在 SDL3 上,
# 執行時 dlopen libSDL3)。dylibbundler 只跟靜態相依,抓不到 runtime dlopen 的
# SDL3 → 玩家看到「Failed loading SDL3 library」(repo issue #1)。源碼編真 SDL2 根治。
#
# 與 openkb 的 build-sdl2-from-source.sh 同源,差別:MOO 音樂是 XMIDI(MIDI),
# 需 fluidsynth 後端(供 -sdlmixersf 的 SoundFont);故 SDL2_mixer 啟用 fluidsynth
# 並「連結進去」(非 dlopen-shared),dylibbundler 才包得到。其餘 codec 全關
# (MOO 只用 WAV 音效 + MIDI 音樂,不用 OGG/FLAC/MP3/MOD)。fluidsynth 由 brew 提供。
#
# 用後設 PATH="$PREFIX/bin:$PATH",1oom 的 configure 即會用此 sdl2-config。
set -e

PREFIX="${1:?用法: build-sdl2-mac.sh PREFIX}"
SDL_VER=2.30.9
MIX_VER=2.8.0
WORK="$(mktemp -d)"
mkdir -p "$PREFIX"

dl() { wget -q "$1" -O "$2" || curl -fsSL "$1" -o "$2"; }

# fluidsynth 的 pkg-config(macOS brew / Linux 系統)
if command -v brew >/dev/null 2>&1; then
  FS_PREFIX="$(brew --prefix fluid-synth 2>/dev/null || true)"
  [ -n "$FS_PREFIX" ] && export PKG_CONFIG_PATH="$FS_PREFIX/lib/pkgconfig:${PKG_CONFIG_PATH:-}"
fi

cd "$WORK"
echo "[sdl-mac] 下載 SDL2 $SDL_VER / mixer $MIX_VER"
dl "https://github.com/libsdl-org/SDL/releases/download/release-$SDL_VER/SDL2-$SDL_VER.tar.gz" sdl2.tgz
dl "https://github.com/libsdl-org/SDL_mixer/releases/download/release-$MIX_VER/SDL2_mixer-$MIX_VER.tar.gz" mix.tgz

echo "[sdl-mac] 1/2 真 SDL2(非 sdl2-compat)"
tar xf sdl2.tgz && cd "SDL2-$SDL_VER"
./configure --prefix="$PREFIX" >/dev/null && make -j4 >/dev/null && make install >/dev/null
cd "$WORK"
export PATH="$PREFIX/bin:$PATH"

echo "[sdl-mac] 2/2 SDL2_mixer(fluidsynth MIDI 連結進去;其餘 codec 全關)"
tar xf mix.tgz && cd "SDL2_mixer-$MIX_VER"
./configure --prefix="$PREFIX" --with-sdl-prefix="$PREFIX" \
  --enable-music-midi --enable-music-midi-fluidsynth --disable-music-midi-fluidsynth-shared \
  --disable-music-midi-timidity --disable-music-midi-native \
  --disable-music-ogg --disable-music-ogg-stb --disable-music-ogg-vorbis --disable-music-ogg-tremor \
  --disable-music-flac-libflac --disable-music-flac-drflac \
  --disable-music-mod-modplug --disable-music-mod-xmp \
  --disable-music-mp3-mpg123 --disable-music-mp3-minimp3 --disable-music-opus \
  >/tmp/sdlmix-conf.log 2>&1 || { echo "SDL2_mixer configure 失敗:"; tail -25 /tmp/sdlmix-conf.log; exit 1; }
grep -iE "fluidsynth" /tmp/sdlmix-conf.log | tail -3 || true
make -j4 >/dev/null && make install >/dev/null
cd /
rm -rf "$WORK"

echo "[sdl-mac] 完成 → $PREFIX(sdl2-config: $PREFIX/bin/sdl2-config)"
echo "[sdl-mac] 真 SDL2 dylib:"; ls -la "$PREFIX"/lib/libSDL2-2.0*.dylib 2>/dev/null || ls -la "$PREFIX"/lib/libSDL2-2.0*.so* 2>/dev/null || true
