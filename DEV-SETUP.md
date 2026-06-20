# 開發環境設定(在另一台電腦接續開發)

讓你把整個《銀河霸主》繁中化專案搬到另一台電腦,用 Claude Code 接著開發。配合可攜包 `MasterOfOrion-CHT-dev-setup.tar.gz` 使用(該包含 git 不收的素材與引擎)。

## 包內容

```
master-of-orion/
├── patch/              繁中化 patch(repo 主體,01..13)
├── scripts/            build / build-font / fetch-engine / apply-patch / playtest / 打包
├── tools/              字型烘製、LBX 萃取(build_cjk_font.py, dump_*.py)
├── docs/               ADR、工程筆記(CJK-DEV-NOTES.md)、譯文(translation/*_zh.tsv)、wiki、img
├── assets/
│   ├── game/           ★ 版權遊戲資料(35 個 *.lbx + save1.gam)— git 不收,本包含
│   └── fonts/cjk24.bin  CJK atlas(衍生資產)
├── 1oom/               ★ 引擎本機 clone(含自身 .git,供 git diff 出 patch)— git 不收,本包含
├── docker/             build 容器 Dockerfile(moo-cht-build)
├── .git/               專案 git 歷史 + remote(可直接 pull/push)
├── CLAUDE.md           專案指示(Claude 自動讀)
├── CONTEXT.md          domain glossary
├── DEV-SETUP.md        本檔
└── claude-context/     Claude 專案記憶(放到新機的 ~/.claude,見下)
```

不含可重建物:`build/`、`build-*/`、`release/`(用腳本重產)。

## 前置(新機需安裝)

- **Docker**(所有 build / 字型烘製 / playtest 都在容器內,不污染系統)
- **git**
- **Claude Code**(`claude`)
- headless 截圖驗證會用容器內的 Xvfb + ImageMagick,無需主機安裝

## 設定步驟

1. 解壓到 home 下(路徑建議與原機一致,Claude 專案脈絡才對得上):
   ```bash
   tar xzf MasterOfOrion-CHT-dev-setup.tar.gz -C ~/
   cd ~/master-of-orion
   ```
2. 放回 Claude 專案記憶(讓新機的 Claude 有同樣脈絡):
   ```bash
   # <user> = 新機帳號;路徑由專案目錄推導
   mkdir -p ~/.claude/projects/-home-<user>-master-of-orion/
   cp -r claude-context/memory ~/.claude/projects/-home-<user>-master-of-orion/
   ```
3. 建 build image + 編譯:
   ```bash
   bash scripts/build.sh        # docker build image + 容器內 autotools + make
   bash scripts/build-font.sh   # 烘 CJK atlas(改了中文後要重跑)
   ```
4. 驗證可玩性:
   ```bash
   bash scripts/playtest.sh     # 載存檔巡覽各畫面、截圖、偵測 crash
   ```

## 開發工作流(改一處 → 出 patch)

1. **改譯文**:編輯 `docs/translation/*_zh.tsv`(strtr 顯示時覆蓋,執行時載入,免重編)。
2. **改程式**:直接改 `1oom/src/...`(疊字、UI 對位等)。
3. **重建 atlas**:加了新中文(含 .c 字面量、tsv)就 `bash scripts/build-font.sh`,否則新字不在 atlas、CJK 靜默不畫。
4. **build + 截圖驗證**:`bash scripts/build.sh`,再用容器內 Xvfb 截圖,Read 圖逐屏校對位/破版/缺字。
5. **出 patch**:
   ```bash
   cd 1oom
   # 新增 untracked 檔(如 cjkfont.c)要先 git add -N 才會進 diff!
   git add -N <新檔>
   git diff -- <檔案...> > ../patch/NN-xxx.patch
   git reset <新檔>            # 還原 intent-to-add
   ```
6. **驗證 patch(關鍵)**:不要只 `git apply --check`(只驗 hunk 套用)。要做**全新上游 + 套全部 patch + 實際編譯**:
   ```bash
   cd 1oom && git stash push -u
   for p in ../patch/*.patch; do git apply --whitespace=nowarn "$p"; done
   cd .. && bash scripts/build.sh   # 必須編譯成功(等同 CI)
   ```
   （踩過雷:`git diff` 不含 untracked 新檔,patch 漏檔,本地有檔能編但 CI 全新 clone 失敗。）
7. **commit/push**:`git add patch/ docs/ assets/fonts/cjk24.bin && git commit && git push`。push 觸發 GitHub Actions（macOS/Linux build）。

## 打包(完整含遊戲)

```bash
bash scripts/build-appimage.sh   # Linux AppImage(輸出 release/)
bash scripts/build-windows.sh    # Windows zip + DLL(輸出 release/)
# Mac:push 後 CI 產 data-free .dmg → 下載 artifact → 本地注入 assets/game/*.lbx → 重打 zip
```

## Claude 接續的脈絡來源

- `CLAUDE.md` / `CONTEXT.md` — 專案指示與術語(Claude 自動讀)
- `docs/CJK-DEV-NOTES.md` — 渲染心智模型、烘字 SOP、踩雷與反思、症狀→原因速查
- `docs/adr/0001` — CJK 渲染與文字來源策略決策
- `git log --oneline` — 完整工作軌跡(patch 01..13)
- `claude-context/memory/moo-cht-project.md` — 專案核心決策史

## 目前進度與剩餘

**已完成**:主要畫面全中文(選單/新遊戲/星圖含星名雙語/星系圖/殖民地/艦隊/艦船設計/種族外交含間諜鈕/科技/外交新聞訊息/設定選單/各彈窗)、F1 說明畫面(142 條)、ORION 標題加「銀河霸主」、戰前/轟炸鈕、跨平台打包。

**刻意保留英文**:艦船名(玩家可編輯 ASCII 欄)、ECM、熱鍵字元表。

**剩餘**:即時戰鬥列(uibattle）按鈕極小、含圖示、雙函式重複繪製且不可截圖驗證 — 若要做,需先準備一個「正要開戰」的存檔以便截圖驗證。
