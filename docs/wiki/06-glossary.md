# 06 術語表 (Glossary)

本表收錄《銀河霸主》的常用遊戲術語中英對照,銜接本專案 `CONTEXT.md` 的用語與中文化字串。命名變數、寫文件、翻譯遊戲文字時優先採用此表;遇到新術語先登錄再用。格式採「英文 — 中文(本專案譯名)— 一句話定義」。

## 種族 (Races)

對應 `game_str.c` 前綴 `ra`。完整介紹見 [02 種族](02-races.md)。

| 英文 | 中文 | 一句話 |
|---|---|---|
| Human | 人類 | 外交與貿易通才 |
| Mrrshan | 莫善 | 貓科戰士,艦砲攻擊特化 |
| Silicoid | 矽基 | 矽基生命,無視汙染、可住惡劣星 |
| Sakkra | 薩克拉 | 爬蟲類,人口爆量擴張 |
| Psilon | 賽隆 | 科研至上,公認最強 |
| Alkari | 阿卡里 | 鳥類飛行員,空戰防禦特化 |
| Klackon | 克拉肯 | 蟲群,生產力極強 |
| Bulrathi | 布拉西 | 熊族,地面戰無敵 |
| Meklar | 梅克拉 | 機械生命,工業產能怪物 |
| Darlok | 達洛克 | 變形者,間諜大師 |

## 科技領域 (Tech Fields)

完整介紹見 [03 科技](03-technology.md)。

| 英文 | 中文 | 一句話 |
|---|---|---|
| Computers | 電腦 | 命中率與情報/間諜成功率 |
| Construction | 建造 | 降低建造成本、裝甲、減廢 |
| Force Fields | 力場 | 護盾與場域裝置 |
| Planetology | 行星學 | 殖民資格、地貌改造、生態 |
| Propulsion | 推進 | 引擎、射程、戰術機動 |
| Weapons | 武器 | 艦載攻擊武器 |

## 機制與系統 (Mechanics)

| 英文 | 中文 | 一句話 |
|---|---|---|
| 4X | 4X | 探索/擴張/開發/殲滅四大核心玩法 |
| Turn | 回合 | 遊戲推進的基本時間單位 |
| BC (Billion Credits) | BC(十億信用點) | 生產/金錢單位 |
| Galactic Council | 銀河議會 | 票數達 2/3 即推舉霸主收尾(對應前綴 `el` 選舉) |
| Production | 生產力 | 行星每回合可投入建造/研究的產出 |
| Research | 研究 | 投入科技的產出,推進科技等級 |
| Population growth | 人口成長 | 殖民地人口增加速率 |
| Pollution / Industrial Waste | 汙染 / 工業廢棄物 | 工廠產生、需花生產力清理(矽基免疫) |
| Espionage / Spying | 間諜 / 諜報 | 偷科技、破壞、嫁禍(達洛克專長) |
| Diplomacy | 外交 | 與其他帝國的協定與關係(對應前綴 `au`) |
| Ground combat | 地面戰 | 運兵船登陸搶星的戰鬥(對應前綴 `gr`,布拉西專長) |

## 行星與環境 (Planets)

對應 `game_str.c` 前綴 `pl`。

| 英文 | 中文 | 一句話 |
|---|---|---|
| Habitable | 可住 | 可直接殖民的行星 |
| Hostile / Barren / Tundra / Toxic … | 惡劣 / 貧瘠 / 凍原 / 有毒… | 需環境控制科技才能殖民,常為富礦 |
| Rich / Ultra Rich | 富礦 / 超富礦 | 生產力加成高,後期造艦本錢 |
| Controlled Environment | 環境控制單元 | 解鎖殖民惡劣行星的科技 |
| Terraforming | 地貌改造 | 提高行星人口上限 |
| Soil Enrichment | 土壤改良 | 把一般環境改成肥沃,提升人口上限 |

## 艦船與戰鬥 (Ships & Combat)

對應前綴 `sd`(艦船設計)、`bt`(戰鬥)。完整介紹見 [04 艦船與戰鬥](04-ships-combat.md)。

| 英文 | 中文 | 一句話 |
|---|---|---|
| Hull (Small/Medium/Large/Huge) | 艦體(小/中/大/巨型) | 艦船尺寸,越大越耐打越貴 |
| Beam Weapon | 光束武器 | 直射能量武器,靠戰鬥電腦命中 |
| Missile | 飛彈 | 自走武器,早中期主力 |
| Torpedo | 魚雷 | 中遠程,對大目標傷害高 |
| Bomb | 炸彈 | 對行星轟炸 |
| Battle Computer | 戰鬥電腦 | 提升命中率 |
| Deflector Shield | 偏導護盾 | 抵減每次命中傷害(Class I~X) |
| Planetary Shield | 行星防護罩 | 保護行星不被轟炸(Class I~V) |
| Armor / Double Hull | 裝甲 / 雙層艦體 | 提升艦船總血量 |
| ECM Jammer | ECM 干擾器 | 降低敵方飛彈命中 |
| Maneuverability | 機動力 | 對光束與飛彈的閃避 |
| Attack Roll | 攻擊判定 | 1~100 隨機數 + 命中加成 − 機動力 |
| High Energy Focus | 高能聚焦 | 確立光束後期統治的關鍵裝置 |
| Repulsor Beam | 斥力光束 | 把敵艦推開、封鎖投彈 |
| Stasis Field | 靜滯場 | 凍結敵艦 |
| Cloaking Device | 隱形裝置 | 讓艦船隱形難鎖 |
| Missile Base | 飛彈基地 | 行星防禦設施(對應前綴 `sm` 星圖防禦) |
| Stellar Converter | 恆星轉換器 | 頂級武器,可摧毀目標 |

## 引擎/中文化相關 (Engine / CHT)

承本專案 `CONTEXT.md`,此處僅列與 wiki 內容相關者,完整定義以 `CONTEXT.md` 為準。

| 英文 | 中文 | 一句話 |
|---|---|---|
| 1oom | 1oom | 重現 MOO1 的開源 C 引擎,本專案採 `fork1oom` |
| LBX | LBX | MOO 資源封裝格式,內含文字/圖像/字型/音樂 |
| game_str | game_str | `game_str.c`,1oom 中央 UI 字串表(約 1256 條) |
| token (MSb char) | token(MSb 字元) | 外交/事件訊息中動態代入記號(種族名、BC 數),翻譯須保留 |

## 譯名取捨備註

- **種族譯名**統一採本專案既定譯法(賽隆/莫善/矽基…),不隨外部攻略站的其他音譯。
- **科技/裝置譯名**以「意譯為主、保留原文對照」為原則,方便玩家在英文原版與中文化版之間對照。
- 與遊戲內字串(`game_str.c`、`research.lbx`)的實際譯文若有出入,**以實際中文化字串為準**,並回填本表。

## 參考來源

- 本專案 `CONTEXT.md`、`docs/TEXT-INVENTORY.md`
- StrategyWiki — Master of Orion: <https://strategywiki.org/wiki/Master_of_Orion>
- Official Master of Orion Wiki (Fandom): <https://masteroforion.fandom.com/wiki/Master_of_Orion>
