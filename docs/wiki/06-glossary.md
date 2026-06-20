# 06 術語表(中英對照)

這份術語表把《銀河霸主》玩法中會碰到的名詞,整理成「中文 ←→ English」的對照。百科正文以中文為主,但你在遊戲裡、或在英文攻略、論壇上看到的仍是原文——這張表就是兩邊的橋:看到中文查得到原文,看到原文也找得回中文。內容同時銜接本專案 `CONTEXT.md` 的用語與中文化字串。

> 用法:各表第一欄為本專案正式中文譯名(即遊戲中文化後實際顯示的字),第二欄為遊戲原文,第三欄為一句話說明。各分類後標註對應的引擎字串前綴,方便對照原始碼。

## 種族 Races

對應 `game_str.c` 前綴 `ra`。完整介紹見 [02 種族](02-races.md)。

| 中文 | English | 一句話 |
|---|---|---|
| 人類 | Human | 外交與貿易通才 |
| 莫善 | Mrrshan | 貓科戰士,艦砲攻擊特化 |
| 矽基 | Silicoid | 矽基生命,無視汙染、可住惡劣星 |
| 薩克拉 | Sakkra | 爬蟲類,人口爆量擴張 |
| 賽隆 | Psilon | 科研至上,公認最強 |
| 阿卡里 | Alkari | 鳥類飛行員,空戰防禦特化 |
| 克拉肯 | Klackon | 蟲群,生產力極強 |
| 布拉西 | Bulrathi | 熊族,地面戰無敵 |
| 梅克拉 | Meklar | 機械生命,工業產能怪物 |
| 達洛克 | Darlok | 變形者,間諜大師 |

## 科技領域 Tech Fields

完整介紹與全部 187 項科技見 [03 科技](03-technology.md)。

| 中文 | English | 一句話 |
|---|---|---|
| 電腦 | Computers | 命中率與情報/間諜成功率 |
| 建造 | Construction | 降低建造成本、裝甲、減廢 |
| 力場 | Force Fields | 護盾與場域裝置 |
| 行星學 | Planetology | 殖民資格、地貌改造、生態 |
| 推進 | Propulsion | 引擎、射程、戰術機動 |
| 武器 | Weapons | 艦載攻擊武器 |

## 核心玩法機制 Mechanics

| 中文 | English | 一句話 |
|---|---|---|
| 4X | 4X | 探索/擴張/開發/殲滅四大核心玩法 |
| 回合 | Turn | 遊戲推進的基本時間單位 |
| BC(十億信用點) | BC (Billion Credits) | 生產/金錢單位 |
| 銀河議會 | Galactic Council | 票數達 2/3 即推舉霸主收尾(對應前綴 `el` 選舉) |
| 生產力 | Production | 行星每回合可投入建造/研究的產出 |
| 研究 | Research | 投入科技的產出,推進科技等級 |
| 人口成長 | Population Growth | 殖民地人口增加速率 |
| 汙染 / 工業廢棄物 | Pollution / Industrial Waste | 工廠產生、需花生產力清理(矽基免疫) |
| 間諜 / 諜報 | Espionage / Spying | 偷科技、破壞、嫁禍(達洛克專長) |
| 外交 | Diplomacy | 與其他帝國的協定與關係(對應前綴 `au`) |
| 地面戰 | Ground Combat | 運兵船登陸搶星的戰鬥(對應前綴 `gr`,布拉西專長) |
| 秒差距 | Parsec | 星圖上的距離單位 |
| 曲速 | Warp | 引擎速度等級(曲速 1~9),決定每回合移動的秒差距 |

## 外交與條約 Diplomacy & Treaties

外交訊息中常見的協定與行動。對應前綴 `au`(外交)、`el`(選舉)。

| 中文 | English | 一句話 |
|---|---|---|
| 互不侵犯協定 | Non-Aggression Pact | 雙方約定不主動攻擊對方艦隊(除非進入對方殖民地軌道) |
| 同盟 | Alliance | 更緊密的盟約,可互相造訪殖民地、補給燃料 |
| 貿易協定 | Trade Agreement / Trade Pact | 雙方每年交易固定金額,提升雙方產出與關係 |
| 和平條約 | Peace Treaty | 終止雙方一切敵對行動 |
| 進貢 | Tribute | 主動致贈金額或科技以改善關係/賠罪 |
| 宣戰 | Declare War | 正式開戰,大使撤回 |
| 大使 | Ambassador | 外交對口,宣戰時撤回、緩和時回任 |
| 皇帝 | Emperor | 各帝國的領袖,外交訊息中以名字代入 |

## 行星與環境 Planets & Environment

對應 `game_str.c` 前綴 `pl`。

| 中文 | English | 一句話 |
|---|---|---|
| 可住 | Habitable | 可直接殖民的行星 |
| 惡劣(貧瘠/凍原/死寂/煉獄/有毒/輻射) | Hostile (Barren/Tundra/Dead/Inferno/Toxic/Radiated) | 需對應的受控環境科技才能殖民,常為富礦 |
| 富礦 / 超富礦 | Rich / Ultra Rich | 生產力加成高,後期造艦本錢 |
| 受控環境 | Controlled Environment | 解鎖殖民惡劣行星的科技 |
| 地貌改造 | Terraforming | 提高行星人口上限 |
| 土壤改良 | Soil Enrichment | 把一般環境改成肥沃,提升人口上限 |
| 樂土 | Gaia | 最肥沃的環境,人口成長加倍 |
| 殖民者 | Colonist | 行星上的人口單位,投入生產與研究 |

## 艦船與戰鬥 Ships & Combat

對應前綴 `sd`(艦船設計)、`bt`(戰鬥)。完整介紹見 [04 艦船與戰鬥](04-ships-combat.md);武器/裝置的逐項對照見 [03 科技](03-technology.md) 的武器、力場、推進三領域表。

| 中文 | English | 一句話 |
|---|---|---|
| 艦體(小/中/大/巨型) | Hull (Small / Medium / Large / Huge) | 艦船尺寸,越大越耐打越貴 |
| 光束武器 | Beam Weapon | 直射能量武器,靠戰鬥電腦命中 |
| 飛彈 | Missile | 自走武器,早中期主力 |
| 火箭 | Rocket | 早期低成本自走武器 |
| 魚雷 | Torpedo | 中遠程,對大目標傷害高 |
| 炸彈 | Bomb | 對行星轟炸 |
| 戰鬥電腦 | Battle Computer | 提升命中率 |
| 導引電腦 | Targeting Computer | 飛彈/魚雷自帶的命中加成 |
| 偏導護盾 | Deflector Shield | 抵減每次命中傷害(I~XV 級) |
| 行星護盾 | Planetary Shield | 保護行星不被轟炸(V~XX 級) |
| 裝甲 / 雙層艦體 | Armor / Double Hull | 提升艦船總生命值 |
| 生命值 | Hit Points | 艦船可承受的傷害量 |
| ECM 干擾器 | ECM Jammer | 降低敵方飛彈命中 |
| 機動力 | Maneuverability | 對光束與飛彈的閃避 |
| 攻擊判定 | Attack Roll | 1~100 隨機數 + 命中加成 − 機動力 |
| 先攻 | Initiative | 戰鬥中的行動順序 |
| 高能聚焦 | High Energy Focus | 使能量武器射程 +3,確立光束後期統治 |
| 斥力光束 | Repulsor Beam | 把敵艦推開、封鎖投彈 |
| 靜滯場 | Stasis Field | 凍結敵艦 |
| 隱形裝置 | Cloaking Device | 讓艦船隱形難鎖 |
| 飛彈基地 | Missile Base | 行星防禦設施(對應前綴 `sm` 星圖) |
| 運兵船 | Troop Transport | 載運地面部隊登陸搶星 |
| 恆星轉換器 | Stellar Converter | 頂級武器,軌道轟擊可摧毀行星 |
| 死光 | Death Ray | 招牌遠古武器,後期決戰火力 |

## 引擎與中文化 Engine & CHT

承本專案 `CONTEXT.md`,此處僅列與 wiki 內容相關者,完整定義以 `CONTEXT.md` 為準。

| 中文 | English | 一句話 |
|---|---|---|
| 1oom | 1oom | 重現 MOO1 的開源 C 引擎,本專案採 `fork1oom` |
| LBX | LBX | MOO 資源封裝格式,內含文字/圖像/字型/音樂 |
| game_str | game_str | `game_str.c`,1oom 中央 UI 字串表(約 1256 條) |
| 動態代入記號 | token (MSb char) | 外交/事件訊息中動態代入記號(種族名、BC 數),翻譯須保留 |

## 譯名取捨備註

- **種族譯名**統一採本專案既定譯法(賽隆/莫善/矽基…),不隨外部攻略站的其他音譯。
- **科技/裝置譯名**以「意譯為主、保留原文對照」為原則,方便玩家在英文原版與中文化版之間對照;全部 187 項科技的中英逐項對照見 [03 科技](03-technology.md)。
- 與遊戲內字串(`game_str.c`、`research.lbx`)的實際譯文若有出入,**以實際中文化字串為準**,並回填本表。

## 參考來源

- 本專案 `CONTEXT.md`、`docs/TEXT-INVENTORY.md`、`docs/translation/`(科技、外交、新聞中英對照 tsv)
- StrategyWiki — Master of Orion: <https://strategywiki.org/wiki/Master_of_Orion>
- Official Master of Orion Wiki (Fandom): <https://masteroforion.fandom.com/wiki/Master_of_Orion>
