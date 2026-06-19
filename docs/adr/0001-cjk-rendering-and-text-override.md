# ADR 0001 — CJK 渲染與文字來源策略

狀態:草案(待 review)
日期:2026-06-20
關聯:`docs/TEXT-INVENTORY.md`、`CONTEXT.md`

## 背景

MOO1 文字分兩類來源(見盤點):核心 UI 在 `game_str.c`(C 常量),其餘對話/新聞/名稱/科技名在 5 個 LBX。引擎 `lbxfont.c` 以**逐 byte**方式查 ASCII 點陣字(字寬表 0x60 項,對應 0x20–0x7f)渲染到 **320×200** 邏輯緩衝,再放大到視窗。本專案採 `fork1oom`/`master-vanilla-testing`,**無 PBX**。

## 決策一:CJK 渲染 hook 在 lbxfont 字串迴圈

在 `lbxfont.c` 處理字串的迴圈(`lbxfont_print_str_do`、`lbxfont_print_str_limit_do`、`lbxfont_split_str`、`lbxfont_calc_str_width`)中:

1. 逐 byte 掃描時偵測 UTF-8 多 byte 序列(首 byte ≥ 0xC0)。
2. 解出 CJK 碼點 → 從自帶 atlas 二分查找 glyph → plot 到 VGA buffer。
3. x 前進量 = CJK glyph 邏輯寬;ASCII 仍走原路徑。

優點:單一 hook 覆蓋所有經 lbxfont 的文字(game_str + LBX 皆然);不動上層 UI 程式。

## 決策二:game_str.c 直接 source patch

`game_str.c` 是 C 常量字串,翻譯 = 字面量換 UTF-8 中文。以 patch 形式散布,乾淨、無版權問題。為 P0 主要工作。

## 決策三:LBX 文字用「載入後覆蓋層」(設計先行,實作時程待定)

因無 PBX 且不可散布改過的版權 LBX:在引擎於 LBX 字串載入後,用本專案自帶譯文檔(非版權)以 key 取代。

- key 設計:`(lbx 檔名, entry, index)` → 譯文。
- 譯文檔格式候選:CSV / JSON / 自訂二進位(待 ADR 補充)。
- token(MSb 字元)原樣保留,中文語序下的代入位置另議。
- 範圍:P0 先 `research.lbx`(科技名)、`names.lbx`;P1 diplomat/eventmsg;P2 help。

> 依使用者決定:覆蓋層**先研究設計**(本 ADR),實作時點於 game_str.c + 渲染打通後再定。

## 決策四:字型 pipeline 重用 u4-cht

重用 `~/u3-cht/u4-cht/tools/build_cjk_font.py`:從翻譯文字收集漢字子集 → 用系統 TTF 烘點陣 atlas(`.bin`:magic + glyphW/H + count + 逐字 alpha,二分查找)+ preview PNG。

- 來源字型(系統內、可散布):**AR PL UMing TW**(`uming.ttc`,文鼎明體繁中)或 **AR PL UKai TW**(`ukai.ttc`,楷書);備選 Noto Sans/Serif CJK TC。
- 產出 `.bin` 為衍生資產,入庫 `assets/fonts/`。
- 子集化 → 檔案小、只含實際用到的字。

## 決策五:拉高內部畫布 640×480 + 底圖 pixel scaling + CJK 24×24

採 `rules/81-retro-cjk-hires-canvas`(freesynd-cht 驗證過的技巧):**不縮小中文字去塞 320×200**,而是把引擎內部畫布拉高,原始 320×200 底圖用 nearest-neighbor pixel scaling 放大,中文字以 24×24 畫在放大後的畫布。

- **內部畫布**:320×200 → **640×480**(真 4:3,方塊字不變形)。原版 320×200 底圖以最近鄰放大填入。
  - 取捨備註:640×400 為乾淨 2× 但非 4:3;640×480 觀感方正但需把原 200/400 高度版面以 `mapY()` 比例映射到 480。實作時擇一(預設 640×480 + mapY)。
- **底圖縮放**:nearest-neighbor(crisp),保持 pixel art 銳利;平滑 HD 版(bilinear,如 1280×960)可後置成獨立選項。
- **CJK**:24×24 點陣,畫在 640×480 畫布;ASCII 走原 lbxfont 路徑。
- **改點**:`src/vgabuf.h` `VGABUF_W/H` 等畫布常數、`src/hw/sdl/2` 縮放路徑、UI 座標 mapY、滑鼠命中區映射。

踩雷(見 rule 81):raw 座標 widget(小地圖)不重複映射、滑鼠 hit-test 一併映射、SDL2 scale mode 相容、優先整數縮放。

Phase 3 先把畫布放大 + 底圖 pixel scaling 打通(英文版在 640×480 下正常),再接 24×24 CJK atlas,抓高密度畫面(科技樹/殖民管理)截圖驗證。
