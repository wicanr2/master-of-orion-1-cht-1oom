#!/usr/bin/env bash
# Mac 完整包(含遊戲):下載 GitHub Actions 的 data-free .dmg,本地注入遊戲資料 +
# atlas + 譯文 + MIDI SoundFont,並改 launch wrapper 帶 -sdlmixersf(否則音樂靜音),
# 重新打包成 zip。Mac .app 的 .dmg/dylib 由 CI(macos-14 arm64)產生,本機無法做。
# 需:gh(已登入)、docker(moo-cht-build image)。輸出 release/(含版權資料,不入庫)。
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REPO="${MOO_REPO:-wicanr2/master-of-orion-1-cht-1oom}"

ls "$ROOT"/assets/game/*.lbx >/dev/null 2>&1 || { echo "缺原版資料 assets/game/*.lbx"; exit 1; }

echo "[repack-mac] 下載最新成功 build 的 Mac artifact"
RUN=$(gh run list --repo "$REPO" --workflow build --status success --limit 1 --json databaseId -q '.[0].databaseId')
[ -n "$RUN" ] || { echo "找不到成功的 build run(先 push 觸發 CI)"; exit 1; }
rm -rf /tmp/moo-macdl; mkdir -p /tmp/moo-macdl
gh run download "$RUN" --repo "$REPO" -n MasterOfOrion-CHT-mac -D /tmp/moo-macdl
cp /tmp/moo-macdl/*.dmg /tmp/moo-mac.dmg

docker run --rm -v "/tmp:/tmp" -v "$ROOT:/work" -w /tmp moo-cht-build bash -euc '
  apt-get update -qq >/dev/null 2>&1 && apt-get install -y -qq p7zip-full zip timgm6mb-soundfont >/dev/null 2>&1
  rm -rf /tmp/macx; mkdir -p /tmp/macx; cd /tmp/macx
  7z x /tmp/moo-mac.dmg >/dev/null 2>&1
  APP="Master of Orion CHT.app"; DATA="$APP/Contents/Resources/data"
  cp /work/assets/game/* "$DATA/" 2>/dev/null
  cp /work/assets/fonts/cjk24.bin "$DATA/"
  cp /work/docs/translation/*_zh.tsv "$DATA/translation/"
  cp /usr/share/sounds/sf2/TimGM6mb.sf2 "$DATA/"   # MIDI 音樂 SoundFont(fluidsynth 用)
  # launch wrapper 帶 -sdlmixersf(SDL2_mixer+fluidsynth 不讀 SDL_SOUNDFONTS)
  sed -i "s#-data \"\$DIR/../Resources/data\"#-data \"\$DIR/../Resources/data\" -sdlmixersf \"\$DIR/../Resources/data/TimGM6mb.sf2\"#" "$APP/Contents/MacOS/launch"
  mkdir -p /work/release; rm -f /work/release/MasterOfOrion-CHT-mac-full.zip
  zip -qr -y /work/release/MasterOfOrion-CHT-mac-full.zip "$APP"
  echo "lbx:$(ls "$DATA"/*.lbx|wc -l) sf2:$(ls "$DATA"/TimGM6mb.sf2 2>/dev/null|wc -l)"
  ls -la /work/release/MasterOfOrion-CHT-mac-full.zip
'
echo "[repack-mac] -> release/MasterOfOrion-CHT-mac-full.zip(arm64,完整含遊戲 + 音樂 SoundFont)"
