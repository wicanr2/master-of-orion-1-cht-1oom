# 文字資產盤點 (Phase 2)

盤點 MOO1 繁中化需翻譯的全部文字來源,分「C source」與「LBX 資料檔」兩類。
基於 `fork1oom` 分支 `master-vanilla-testing` + `1oom/doc/format_lbx.txt`。

## 結論先講

- 核心 UI/玩法文字 **集中在一個檔**:`src/game/game_str.c`(約 1256 條字串),涵蓋幾乎所有遊戲畫面 → 翻譯主戰場,直接 patch source。
- 其餘對話/新聞/求助/科技名 在 5 個 LBX 內 → **本 fork 無 PBX**,需在引擎加「載入後覆蓋」層(Phase 3),不可改散布原版 LBX。

## 一、C source 文字(以 source patch 翻譯)

| 來源 | 內容 | 規模 | 備註 |
|---|---|---|---|
| `src/game/game_str.c` / `.h` | 中央字串表:主選單、種族、銀河大小、難度、特性、行星名、艦船名、武器、各畫面 UI 標籤 | ~1256 字串 / ~500 符號 | **主要目標**。前綴對應畫面:`sm`星圖(105)、`sd`艦船設計(49)、`au`外交(40)、`el`選舉(26)、`nt`新科技、`gr`地面戰、`ra`種族、`pl`行星、`bt`戰鬥、`wl`勝負… |
| `src/ui/classic/*.c` | 直接寫死在繪字呼叫的字面量 | ~8 處(如 `"Pages"`) | 量極少,順手翻 |
| `src/game/game_news.c`、`game_audience.c` 等 | 少量輔助字串 | 散見 | 多數已併入 game_str |

繪字 API:`lbxfont_print_str_*`(`src/lbxfont.h`)。所有上述字串最終經此渲染 → Phase 3 CJK 渲染需涵蓋。

## 二、LBX 資料檔文字(本 fork 無 PBX → 需引擎覆蓋層)

依 `doc/format_lbx.txt`:

| LBX | entry | 內容 | 規模 | 特殊 |
|---|---|---|---|---|
| `diplomat.lbx` | 1 | 外交會談訊息(audience messages) | 1215 條,每型 15 變體,單條 0xc8 byte | 字元 **MSb=1 為 token**(種族名、BC 數量等動態代入),翻譯須保留 token |
| `eventmsg.lbx` | 0 | 新聞/事件訊息(news) | 154 條,每型 7 變體,0xc8 byte | 同上 token 機制 |
| `names.lbx` | 0 | 星球/領袖名 | 60 entry × 20 byte(6 race × 10) | 定長,中文需控字數 |
| `help.lbx` | 0 | 遊戲內求助文字 | 0x28 項,每項含多段字串表 | 參考性質,可後置 |
| `research.lbx` | 1 | 科技名稱 | null 分隔字串,約 0xf3c byte | 科技樹名,屬核心 |

## 三、關鍵發現:本 fork 無 PBX

`1oom-fork/1oom`(GitHub)有 PBX(外掛式文字/圖像覆蓋,專為 mod/翻譯設計),但本專案採用的 sourcecraft **`fork1oom` / `master-vanilla-testing` 分支沒有 PBX**(刻意貼近原版)。

影響:
- **C source 字串(game_str.c)**:直接改 source → 乾淨,以 patch 散布,無版權問題。
- **LBX 字串**:不能散布改過的原版 LBX(版權),又無 PBX 覆蓋管道 → 需在引擎**新增覆蓋層**:LBX 載入後,用本專案自帶的譯文資料檔取代字串。此為 Phase 3 引擎工作。

## 四、翻譯範圍對應(承「核心 UI/玩法優先」)

| 優先 | 對象 |
|---|---|
| P0 核心 | `game_str.c`(全畫面 UI)、`research.lbx` 科技名、`names.lbx` 名稱 |
| P1 次要 | `diplomat.lbx` 外交對話、`eventmsg.lbx` 新聞 |
| P2 後置 | `help.lbx` 求助、intro/winlose 影格內嵌文字 |

## 五、待定

- LBX 覆蓋層的譯文檔格式(自訂 JSON/CSV vs 仿 LBX entry)— Phase 3 設計。
- token(MSb 字元)在中文語序下的代入位置處理。
- 定長欄位(names.lbx 20 byte)中文字數上限。
