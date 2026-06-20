# 銀河霸主 繁體中文化 — Master of Orion 1 (1oom)

> 把 1993 年的 4X 始祖《銀河霸主》(Master of Orion, MicroProse)做成**繁體中文**版,跑在開源重製引擎 [1oom](https://git.sourcecraft.dev/fork1oom/1oom) 上。
> 不縮小中文字硬塞低解析,而是**自製 24×24 高解析 CJK 渲染管線**,原始點陣美術用 pixel scaling 放大,中文清晰呈現。

這不只是「翻字串」。MOO1 的文字散落在**引擎原始碼、版權資料檔(.lbx)、甚至烘進背景圖的影像**三個地方,而且畫面是固定的 320×200 點陣——中文字筆畫多,放進去不是糊成一團就是擠爆版面。這個專案解掉的,是這些底層問題。

---

## 成果

![遊玩 demo](docs/img/demo.gif)

> 研究畫面 → 種族關係 → 外交會談 → 艦船設計 → 星圖,全程繁體中文。

### 遊戲內畫面 — 從主選單到星圖

| | |
|---|---|
| ![主選單](docs/img/milestone-menu-cjk.png) | ![新遊戲](docs/img/milestone-newgame-full-cjk.png) |
| **主選單**:繼續 / 讀取進度 / 新遊戲 / 離開 | **新遊戲設定**:標籤、數值、按鈕全中文且對齊 |
| ![種族選擇](docs/img/milestone-race-cjk.png) | ![研究](docs/img/milestone-tech-cjk.png) |
| **種族選擇**:十大種族 + 種族特性 | **研究畫面**:187 個科技名 + 描述全中文 |

星圖底部的常駐選單列也全中文:**遊戲 / 設計 / 艦隊 / 星圖 / 種族 / 行星 / 科技 / 下一回合**(見 `docs/img/milestone-starmap.png`)。

---

## 技術貢獻

這份專案的核心價值在於解決了「老遊戲中文化」三個底層難題,且全程**不修改、不散布任何版權檔案**:

### 1. 自製 24×24 高解析 CJK 渲染管線
MOO1 在 320×200 點陣算圖。直接畫 24px 中文會爆版,縮小又糊。解法是**換維度**(見 [`docs/adr/0001`](docs/adr/0001-cjk-rendering-and-text-override.md)):影像層把 320×200 遊戲畫面以 2× nearest 放大進 640×400 合成層,中文 24×24 直接畫在這層——底圖維持 pixel art 銳利,中文有足夠空間清晰呈現。字色自動提亮 + 黑外框,任何背景皆可讀。

### 2. LBX 字串覆蓋層(無 PBX 的翻譯方案)
科技名、科技描述、外交/新聞訊息等文字烘在版權資料檔(`research.lbx`/`diplomat.lbx`/`eventmsg.lbx`)裡。本引擎分支沒有 mod 覆蓋機制(PBX),又不能散布改過的版權檔。解法是引擎內**載入後覆蓋層** `strtr`:用自帶的 `英文→繁中` 對照表(共 863 條),在字串顯示前即時替換。譯文是我們的衍生資產,版權檔分毫未動。
外交/新聞訊息更含**動態 token**(`\xNN` 標記,執行時代入種族名/數值);覆蓋層保留 token 並讓訊息處理迴圈能正確區分「UTF-8 中文位元組」與「token 位元組」。

### 3. 引擎疊字覆蓋固定標籤
有些標籤(新遊戲面板的「Galaxy Size」、按鈕的「Cancel/Ok」)是**烘進背景圖的影像**,不是字串。解法是在繪製後**取樣面板色蓋掉英文、置中疊上中文**——同樣不改版權圖。

### 4. patch-only 架構
本 repo **只放繁中化 patch + 字型 + 工具**,不含引擎本體與遊戲資料。任何人取得官方 1oom + 自己的正版 MOO,套上 patch 即可自行建置。

---

## 翻譯內容

- **引擎字串**(`game_str.c`):約 500 條 UI 字串繁中化(選單、殖民、外交、種族關係、星圖、艦船設計…)
- **科技系統**:187 個科技名 + 187 條科技描述(從 `research.lbx` 萃取後翻譯,經引擎覆蓋層注入)
- **外交 / 新聞訊息**:417 條外交會談 + 72 條新聞事件(從 `diplomat.lbx`/`eventmsg.lbx` 萃取),含**動態 token**(種族名/數值/年份等執行時代入),翻譯保留 token 並處理中文語序
- **附帶**:一份《銀河霸主》[繁體中文小百科](docs/wiki/)(概述 / 種族 / 科技 / 艦船戰鬥 / 策略 / 術語,科技篇含完整六大領域科技表)

字型由系統繁中字型(文鼎明體 AR PL UMing TW)烘成 24×24 點陣子集 atlas,只含實際用到的字。

---

## 快速開始

```bash
scripts/fetch-engine.sh     # 取得 1oom 引擎(fork1oom)
scripts/apply-patch.sh      # 套上 patch/ 繁中化 patch
scripts/build-font.sh       # 烘 CJK atlas -> assets/fonts/cjk24.bin
scripts/build.sh            # docker 內 build

# 放入自備的原版 MOO 1.3 資料檔(assets/game/),設兩個環境變數後執行:
MOO_CJK_FONT=assets/fonts/cjk24.bin \
MOO_STR_TR=docs/translation \
  build/src/1oom_classic_sdl2 -data assets/game -winw 960 -winh 600
```

`scripts/playtest.sh` 會載入存檔自動巡覽各主要畫面、截圖並偵測 crash,用於驗收可玩性。

## 目錄結構

| 路徑 | 說明 |
|---|---|
| `patch/` | 繁中化 patch（**本 repo 主體**）：渲染 / 字串 / UI 疊字 / 清單列距 / 科技覆蓋 |
| `tools/` `scripts/` | 字型烘製、LBX 萃取、取引擎、套 patch、建置、playtest |
| `docs/translation/` | `英文→繁中` 譯文表(科技名/描述,引擎覆蓋層讀取) |
| `docs/wiki/` | 《銀河霸主》繁中小百科 |
| `docs/adr/` | 架構決策紀錄(CJK 渲染與文字來源策略) |
| `assets/fonts/cjk24.bin` | 24×24 CJK 點陣 atlas（衍生資產） |
| `1oom/` `assets/game/` | 引擎參考 clone、原版資料（**不入版本庫**） |

## 進度與限制

- [x] CJK 24×24 高解析渲染管線
- [x] 引擎字串全量翻譯（~500 條）
- [x] 科技名 + 描述 LBX 覆蓋層
- [x] 新遊戲 / 種族 / 研究等畫面對位完成
- [x] 可玩性驗證(載存檔巡覽全程無 crash)
- [x] **多尺寸 CJK(24/16/14)**:依原版字型高度自動選尺寸,密集面板(殖民生產列、外交關係框)中文自動縮小容納,選單/標題維持 24px
- [x] 外交 / 新聞訊息覆蓋(489 條,含動態 token;會談畫面實機驗證)
- [~] **烘字標籤 / 按鈕疊字**:研究 tab、外交畫面按鈕已中文;其餘畫面 tab/按鈕逐屏進行中
- [ ] 真·點陣美術文字(intro 動畫、ORION 標題 logo,需編輯圖檔)
- [ ] 跨平台打包(Linux AppImage / Windows)

## 授權

繁中化部分依循上游 1oom 的 GPLv2。原版遊戲資料著作權屬 MicroProse / 原權利人,本專案不散布。
字型衍生自文鼎 AR PL 字型(Arphic Public License)。
