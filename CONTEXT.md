# CONTEXT — 銀河霸主 (Master of Orion 1) 繁中化 Ubiquitous Language

本檔為專案 domain glossary。命名變數、寫文件、討論時優先使用以下術語;遇新概念先登錄再用。
格式:`Term — definition. _Avoid_: forbidden synonyms`。

## 專案

- **MOO1 / 銀河霸主** — Master of Orion (MicroProse, 1993),本專案中文化標的,版本 1.3。
- **1oom** — 重製 MOO1 的開源 C 引擎(GPLv2),直接讀原版資料檔執行。本專案採 sourcecraft **`fork1oom`**(分支 `master-vanilla-testing`)。 _Avoid_: 「模擬器」(它是引擎重製,非 emulator);亦勿與 GitHub `1oom-fork/1oom`(不同源)混用。
- **patch-only repo** — `master-of-orion-1-cht-1oom` 只放繁中化 patch + 字型 + 文件 + 腳本,**不 vendor 引擎本體**;以 `scripts/fetch-engine.sh` 取得 `fork1oom` 後套 patch 建置。
- **CHT / 繁中化** — 繁體中文化。範圍見 README;第一輪聚焦核心 UI/玩法。

## 資料格式

- **LBX** — MOO 的資源封裝格式(`.lbx`),內含文字、點陣圖、字型、音樂。中文化主戰場之一。
- **字型槽 (font slot)** — `fonts.lbx` 內的點陣字型;引擎 `lbxfont.c` 負責繪製。CJK 渲染改此路徑。
- **字串來源 (string source)** — 遊戲文字分兩處:(a) LBX 內字串、(b) hardcode 在 1oom C source。翻譯需同時覆蓋。 _Avoid_: 假設「文字全在 LBX」。

## 中文化技術

- **game_str** — `src/game/game_str.c/.h`,1oom 中央 UI 字串表(~1256 條),涵蓋幾乎所有遊戲畫面。C source 翻譯主戰場。
- **PBX** — 1oom-fork(GitHub)的外掛式文字/圖像覆蓋機制。**本專案 `fork1oom` / `master-vanilla-testing` 分支無 PBX**。 _Avoid_: 假設可用 PBX 做翻譯覆蓋。
- **覆蓋層 (override layer)** — 因無 PBX,需在引擎於 LBX 載入後用本專案譯文檔取代字串的自建機制(Phase 3),避免散布改過的版權 LBX。
- **token(MSb 字元)** — diplomat/eventmsg 訊息中 MSb=1 的字元為動態代入記號(種族名、BC 數量),翻譯須保留。

- **CJK 點陣字** — 24×24 點陣中文字型,畫在放大後的 640×480 畫布(非原 320×200)。來源 AR PL UMing/UKai TW。
- **hi-res canvas / pixel scaling** — 不縮小中文塞低解析,而是把內部畫布 320×200 拉到 640×480、原始底圖 nearest-neighbor 放大,CJK 24×24 畫在放大畫布。見 ADR 0001 與全域規則 `81-retro-cjk-hires-canvas`。
- **破版 (layout overflow)** — UI widget 座標需從原版面以 `mapY()` 比例映射到 640×480,否則溢出/錯位。
- **文字對照表 (string table)** — 原文 → 譯文對照,放 `docs/`,為翻譯與注入的單一真實來源。

## 引擎子系統(1oom/src)

- **lbxfont** — 字型載入與繪製(`lbxfont.c/.h`),CJK 渲染入口。
- **lbxgfx** — LBX 圖像繪製。
- **game/** — 遊戲邏輯與多數 hardcode UI 文字所在。

## Flagged ambiguities(待釐清)

- 24×24 與原版字高的整合方式(放大 UI 框 vs 縮放渲染)— Phase 3 實測後定案。
- patch 形式:單一大 patch vs 依子系統(lbxfont / game 文字)分檔 — Phase 3 開始改 source 時定。
