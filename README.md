# 銀河霸主 — 繁體中文化（Master of Orion 1, 1oom 引擎）

> 進行中的繁體中文化專案。基於開源引擎 1oom（`fork1oom`，GPLv2，MOO1 Classic 重製），加上 24×24 CJK 點陣字渲染與核心介面翻譯。
> 需自備原版 Master of Orion 1.3 資料檔才能執行（本 repo 不含版權素材）。

**本 repo 只放 patch**：引擎本體不 vendor 進來，而是以腳本取得官方 `fork1oom` 後，套上本專案的繁中化 patch 建置。

雜誌風完整 README 待中文化主體完成後撰寫（給同代玩家的一封信）。目前為開發中骨架。

## 快速開始

```bash
scripts/fetch-engine.sh     # 取得 1oom 引擎到本機 1oom/(gitignore,不入庫)
# 後續:套 patch/ → docker build → 放入原版資料檔執行
```

## 目錄結構

| 路徑 | 說明 |
|---|---|
| `patch/` | 對 1oom 引擎的繁中化 patch（**本 repo 主體**） |
| `scripts/` | `fetch-engine.sh` 等環境重建腳本 |
| `assets/fonts/` | CJK 24×24 點陣字 |
| `docs/` | 文字對照表、ADR、字型與技術筆記 |
| `docker/` | SDL2 建置環境 |
| `CONTEXT.md` | 專案術語表 |
| `1oom/` | 1oom 引擎本機參考 clone（`fork1oom`，**不入版本庫**） |
| `assets/game/` | 原版 MOO 1.3 資料檔（版權素材，**不入版本庫**） |

## 現況

- [x] Phase 0 — 環境與素材落地
- [x] Phase 1 — Docker 建置、英文 baseline 可玩（`1oom_classic_sdl2` 已 build,原版資料 35 LBX 全數 md5 驗證通過,開場動畫正常 render）
- [ ] Phase 2 — LBX 文字盤點
- [ ] Phase 3 — CJK 24×24 渲染管線
- [ ] Phase 4 — 抽取 / 翻譯 / 注入
- [ ] Phase 5 — 打包與雜誌風 README

## 授權

中文化部分依循上游 1oom 的 GPLv2。原版遊戲資料著作權屬 MicroProse / 原權利人,本專案不散布。
