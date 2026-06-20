# 繁中化工程筆記:技巧、踩雷與反思

記錄 MOO1（1oom）繁體中文化實作過程中,真正管用的技巧與踩過的雷。與 [ADR 0001](adr/0001-cjk-rendering-and-text-override.md)(設計決策)互補:ADR 講「決定怎麼做」,本檔講「實作時學到什麼、錯在哪、怎麼修」。

## 1. 核心心智模型:高解析合成層

整套 CJK 渲染建立在一個關鍵事實上,先講清楚,後面所有判斷都依賴它:

- 遊戲邏輯緩衝是 **320×200**(`VGABUF`)。
- 影像層把它 **2× nearest 放大成 640×400 合成層**(`CJK_SCALE = 2`),底圖維持 pixel art 銳利。
- **CJK glyph 畫在合成層**,尺寸 `cjkfont_size_for(原字高)` = 24 / 16 / 14 **composite px**,底部貼齊文字行底線(`dst.y = (y + fonth) * 2 - sz`)。

**最重要的換算**:14px CJK 是 composite 像素,換算回 game 邏輯只有 **7px 高**,正好等於原英文小字的字格高度。也就是說 **CJK 字不會比原英文字佔更多垂直空間**——它就坐在原本英文字的格子裡。

> 水平前進量同理:`cjkfont_size_for(h) / 2` game px。相鄰 CJK 在合成層恰好相接,不重疊不留縫。

## 2. 各類文字的中文化手法

| 文字來源 | 手法 |
|---|---|
| `game_str.c`(C 常量) | 直接改字面量為 UTF-8 中文(patch 02) |
| LBX 字串(科技名/描述/外交/新聞) | `strtr` 載入後覆蓋層:`docs/translation/*_zh.tsv`,顯示前 bsearch 替換 |
| 專有名詞(星球/母星名) | `strtr` 顯示時覆蓋,繞過固定緩衝;星圖純中文、詳情雙語 `中文(English)` |
| 烘進按鈕圖的英文(`.lbx` gfx) | **overlay 疊字**:取樣鈕面色蓋掉英文 + 每幀畫中文 |
| 烘進面板背景圖的標籤 | 同上,取樣面板底色蓋字後疊中文 |

**為什麼烘字一律用 overlay,不改原圖**:按鈕/面板圖都在版權的 `.lbx`(VORTEX/STARMAP/BACKGRND/design.bg…)。改原圖等於散布改過的版權素材,違反 patch-only、玩家自備正版的合規底線。overlay 在 framebuffer 疊畫,視覺結果相同但完全不碰版權檔。

## 3. 烘字 overlay SOP

### 按鈕(有獨立 gfx)

1. 把 `uiobj_add_t0(x,y,"",gfx,...)` / `uiobj_add_t3(...)` 改成 `uiobj_add_mousearea(x,y,x+w-1,y+h-1,...)`。
   - **為什麼**:`t0`/`t3` 會在 callback 之後重畫 gfx,把疊好的中文蓋掉。改 mousearea 只留點擊區,繪製交給 draw_cb。
2. 在該畫面的 `draw_cb`(每幀執行)裡:`lbxgfx_draw_frame` 畫底圖 → `ui_draw_btn_cjk(gfx, x, y, "中文")`。
3. t3 切換鈕轉 mousearea 後,點擊邏輯要**手動設值 + 依狀態畫 frame**(原本 t3 自動處理)。
4. 共用 helper `ui_draw_btn_cjk`(`uidraw.c`):取樣鈕面色蓋字 + **依按鈕高度自選字級**(高鈕 24px、矮鈕 14px)+ 用實際 CJK 字高垂直置中。

### 面板烘字標籤(無獨立 gfx,烘在背景圖)

在背景圖畫完之後,逐標籤:取樣標籤區底色 → `vgabuf_draw_filled_rect` 蓋英文 → `lbxfont_print_str_*` 印中文。位置靠實機截圖逐次校正(`screen = 視窗偏移 + game × 縮放`)。

## 4. 踩雷與反思(最有價值的部分)

### 4.1 誤判「密集標籤塞不下 CJK」

一開始看到殖民地側欄的 POP/BASES/滑桿標籤在 6–9px 的密集列,直覺認定 14px CJK 會破版,標記為「技術上做不乾淨」。**這是錯的**,錯在把 composite px 當成 game px。重讀 `cjk_draw_overlay` 才發現 14px CJK 只佔 7px game 高、貼齊原字格底線,密集列塞得下。

**教訓**:高解析合成層本來就提供了空間(rule 81 的核心),不要用 320×200 的直覺去判斷 CJK 是否放得下。先算清楚 composite↔game 的換算再下結論。

### 4.2 page2 背景快取與 overlay 層不相容

撥款彈窗把報表底圖一次性 `vgabuf_copy_back_to_page2()` 快取,之後每幀 restore。在快取階段疊的 CJK **變成空白**——因為 CJK 走 composite overlay 層、每次 flip 清除、由 draw-list 每幀重建,**根本不進 vgabuf**,自然不會被 copy 進 page2。

**教訓**:CJK 疊字必須放在**每幀執行**的 draw_cb,不能放在一次性的背景快取流程。蓋字的 `filled_rect`(進 vgabuf)會留在 page2,但中文(overlay)不會。

### 4.3 `_limit` 列印路徑漏了 CJK 解碼

星圖星名走 `lbxfont_print_str_center_limit → print_str_normal_limit → print_str_limit_do`,這條路徑**逐 byte 處理、沒有 UTF-8/CJK 解碼**(主 `print_str_do` 有)。結果:星名翻成中文後,英文路徑不再 fallback、CJK 又沒渲染 → 星名整個消失。

諷刺的是 ADR 0001 決策一就明列 `print_str_limit_do` 要做 CJK,但實作時只打通了主路徑、漏了 `_limit`。

**教訓**:lbxfont 有多條列印變體(`_do` / `_limit_do` / `split` / `calc_str_width`),加 CJK 時要**逐一**確認都有解碼,別假設共用。修法:在 `_limit_do` 補相同的 `lbxfont_cjk_at` 解碼 + draw-list 記錄。

### 4.4 overlay 不受裁切,邊緣星名溢出

`_limit` 對英文是逐字裁切到視口的;但 CJK overlay(`cjk_draw_overlay`)畫整個 draw-list、**不看 `vgabuf_lim`**。所以星圖邊緣的星名中文會溢出到側欄。修法:在 `_limit_do` 的 CJK 分支加**逐字裁切**——落在 `vgabuf_lim_outside` 的 CJK 不記入 draw-list(對齊英文行為)。

**教訓**:overlay 層獨立於 vgabuf 的裁切機制;凡是原本靠 `_limit` 裁切的場景,CJK 都要自己補裁切。

### 4.5 清單「破格」:三個尺度要一致

艦船設計選元件清單溢出框外,牽涉三個尺度沒對齊:

- 清單列距 `dy` 在 CJK 下被設為 **14px game**(避免水平擠);
- 選擇框高 `ui_design_draw_selbox` 卻用 **8px/列** 算 → 框裝不下實際列高;
- 而 18 列 × 14px = 252px **超過 200px 螢幕** → 根本放不下。

修法:框高改 CJK 感知(14px/列)+ 可見列數降到 11 並提早改用捲動清單。

**教訓**:清單的「列距」「框高計算」「螢幕總高」三者要一起換算成同一尺度;CJK 放大列距時,容納上限會跟著變。

### 4.6 字級一律 14px 偏小

`ui_draw_btn_cjk` 原本寫死 `lbxfont_select(0,...)` → 永遠 14px。大按鈕看起來太小。修法:依按鈕高度選字級(`cjkfont_size_for` 門檻:原字高 ≥10→24px、≥8→16px、否則 14px;選不同 font 改變原字高)。

**教訓**:CJK 尺寸是由「選到的 lbxfont 的原字高」決定的,不是直接指定像素。要大字就選高字型。

## 5. 驗證紀律

每個改動都跑完整迴圈,不靠瞪程式碼:

1. **Docker build**(`scripts/build.sh`,容器內 autotools + make,前景同步)。
2. **重建 atlas**(`scripts/build-font.sh`)——**加了新中文(含註解、tsv)就要重建**,否則新字不在 atlas、CJK 靜默跳過不畫。
3. **xvfb 截圖**:`import -window root` 抓畫面,用 Read 看圖逐屏校對位、檢查破版/溢出/缺字。**不開 GUI viewer**(headless 會卡死)。
4. **playtest**(`scripts/playtest.sh`):載存檔巡覽各畫面,`grep` crash 標誌。
5. **clean-room patch 驗證**:`git stash` 回乾淨上游 → 逐一 `git apply --check` 全部 patch → 確認 patch-only 不變量(任何人套到全新 1oom 都乾淨套用)。

## 6. patch-only 維運

- repo 只放 patch + 字型 + 譯文 + 工具,不含引擎與遊戲資料。
- patch 依**檔案分組**:`git diff -- <files>` 生成各 `NN-*.patch`。同一檔只出現在一個 patch。
- 改動跨多檔的功能(如烘字按鈕)集中在一個主題 patch;共用 helper(`uidraw`)放在最早引入它的 patch。
- 加新中文後**務必重建 atlas 並一起 commit**,否則他人套 patch 後缺字。

## 速查:常見症狀 → 原因

| 症狀 | 多半是 |
|---|---|
| 中文完全沒出現(英文也沒了) | 走到沒加 CJK 解碼的 lbxfont 變體(如 `_limit`);或 atlas 缺該字 |
| 中文閃一下被英文蓋掉 | `t0`/`t3` 還在重畫 gfx,沒轉 mousearea |
| 疊好的中文變空白方塊 | 疊在一次性 page2 快取流程,沒放每幀 draw_cb |
| 中文溢出到相鄰區 | overlay 不受 `_limit` 裁切,需逐字補裁切 |
| 清單/面板破格 | 列距、框高、螢幕高三尺度沒對齊 |
| 字太小 | `ui_draw_btn_cjk` 沒依高度選字級,或選到矮字型 |
| 蓋字露出底下英文邊 | 覆蓋 `filled_rect` 範圍不夠,或位置偏移(截圖校正) |
