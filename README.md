# 銀河霸主 繁體中文化 — Master of Orion 1 (1oom)

把 1993 年的 4X 始祖《銀河霸主》(Master of Orion, MicroProse)做成**繁體中文**版,跑在開源重製引擎 [1oom](https://git.sourcecraft.dev/fork1oom/1oom) 上。
不縮小中文字去硬塞,而是把畫面拉成高解析、原始點陣美術用 pixel scaling 放大,中文用 **24×24** 清晰呈現。

> 進行中的專案。本 repo 只放**繁中化 patch + 字型 + 工具**,不含原版遊戲版權素材;需自備原版 MOO 1.3 資料檔。

---

## 成果

### 主選單

![主選單繁中](docs/img/milestone-menu-cjk.png)

熟悉的 ORION 標題畫面下,選單已是繁體中文:**繼續 / 讀取進度 / 新遊戲 / 離開**。
中文以 24×24 點陣白字加黑外框渲染,在星空背景上清晰可讀;原始 320×200 美術經 nearest-neighbor 放大,維持點陣銳利。

### 新遊戲設定 — 整屏中文

![新遊戲畫面繁中](docs/img/milestone-newgame-full-cjk.png)

這一屏同時示範了兩種中文化路徑都打通:

- **字串值**(銀河大小的「小型」、難度的「簡單」、對手數)— 直接翻譯引擎內字串表。
- **面板標籤**(銀河大小 / 難度 / 對手 / 確定)— 這些字其實是**烘在 LBX 背景圖裡的影像**,不是字串;以「取樣面板色蓋掉英文 + 疊上中文」的方式中文化,無需改動版權圖檔。

---

## 怎麼做到的

MOO1 的畫面是固定的 320×200 點陣,中文字筆畫多,縮到原版字級會糊成一團、硬放大又會塞爆版面。解法是換個維度(詳見 [`docs/adr/0001`](docs/adr/0001-cjk-rendering-and-text-override.md)):

1. **高解析合成層**:影像層把 320×200 遊戲畫面以 2× nearest 放大進 640×400 合成層,中文 24×24 直接畫在這層 — 底圖維持 pixel art 銳利,中文有足夠空間清晰呈現。
2. **CJK 渲染**:`lbxfont` 在字串迴圈解 UTF-8,中文碼點走自製點陣 atlas;字色自動提亮 + 黑外框,任何背景皆可讀。
3. **兩種文字來源**:引擎內字串直接翻譯;烘在 LBX 背景圖的固定標籤用引擎疊字覆蓋。
4. **字型**:由系統繁中字型(文鼎明體 AR PL UMing TW)烘成 24×24 點陣子集 atlas,只含實際用到的字。

字型 atlas 是衍生資產可入庫;原版 `.lbx` / `.exe` 等版權素材不入庫。

---

## 快速開始

```bash
scripts/fetch-engine.sh     # 取得 1oom 引擎(fork1oom)到本機 1oom/
scripts/apply-patch.sh      # 套上 patch/ 內的繁中化 patch
scripts/build-font.sh       # 烘 CJK 24×24 atlas -> assets/fonts/cjk24.bin
scripts/build.sh            # docker 內 build -> build/src/1oom_classic_sdl2

# 放入你自備的原版 MOO 1.3 資料檔(assets/game/),設字型路徑後執行:
MOO_CJK_FONT=assets/fonts/cjk24.bin \
  build/src/1oom_classic_sdl2 -data assets/game -winw 960 -winh 600
```

## 目錄結構

| 路徑 | 說明 |
|---|---|
| `patch/` | 繁中化 patch（**本 repo 主體**）：01 渲染基礎 / 02 字串譯文 / 03 UI 疊字標籤 |
| `tools/` `scripts/` | 字型烘製、取引擎、套 patch、建置腳本 |
| `assets/fonts/cjk24.bin` | 24×24 CJK 點陣 atlas（衍生資產） |
| `docs/` | ADR、文字盤點、CJK 技術筆記、`wiki/` 小百科 |
| `CONTEXT.md` | 專案術語表 |
| `1oom/` `assets/game/` | 引擎參考 clone、原版資料（**不入版本庫**） |

## 進度

- [x] Phase 0–1 — 環境、Docker 建置、英文 baseline
- [x] Phase 2 — 文字盤點（`docs/TEXT-INVENTORY.md`）
- [x] Phase 3 — CJK 24×24 高解析渲染（主選單）
- [~] Phase 4 — 翻譯（字串 + LBX 疊字標籤,逐屏推進中）
- [ ] Phase 5 — 跨平台打包與雜誌風 README

## 授權

繁中化部分依循上游 1oom 的 GPLv2。原版遊戲資料著作權屬 MicroProse / 原權利人,本專案不散布。
字型衍生自文鼎 AR PL 字型(Arphic Public License)。
