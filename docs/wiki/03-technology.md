# 03 六大科技領域

科技是《銀河霸主》的命脈。整個科技體系分成六大領域,每個領域是一條由低到高的研究階梯。本作的關鍵特色是:每場遊戲每個領域只會**隨機亮出一部分**可研究的科技(一般種族約一半,賽隆約 75%),因此沒有固定不變的最佳路線,必須臨機應變。本篇介紹六大領域,並附各領域的**完整科技表**(共 187 項,直接從引擎 `research.lbx` 萃取,依研究階梯由淺到深排列)。

> 譯名說明:下列各表的中文名即本專案的正式譯名(來源:`docs/translation/research_techs_zh.tsv`,將注入引擎)。同一場遊戲不會出現全部科技,表中列的是該領域可能出現的所有項目。

## 科技等級如何計算

帝國在某個領域的「科技等級」並非單純看研究了幾項,而是:

> 取該領域**最高階科技 × 0.8**,再為每一項比它低階的已研究科技 **+1**。

每位玩家開局即擁有所有第 1 級科技,因此六大領域都從 0.8 起算(進位為 1)。這個機制鼓勵玩家穩紮穩打地往上爬,而非只衝單一高階科技。

## 六大領域總覽

| 領域 | 原文 | 一句話 | 主要產出 |
|---|---|---|---|
| 電腦 | Computers | 命中與情報 | 戰鬥電腦、ECM 干擾器、深空掃描、機器人控制、間諜成功率 |
| 建造 | Construction | 造得更便宜更耐打 | 降低造艦/工廠成本、裝甲材料、減廢、自動維修 |
| 力場 | Force Fields | 護盾與場域 | 偏導護盾、行星防護罩、斥力光束、靜滯場、閃電護盾、隱形裝置 |
| 行星學 | Planetology | 殖民與改造星球 | 環境控制、地貌改造、土壤改良、生化武器、複製技術、生態還原 |
| 推進 | Propulsion | 飛得更快更遠 | 引擎(曲速 1~9)、射程、慣性穩定器、傳送、脈衝、高能聚焦 |
| 武器 | Weapons | 把對手打爛 | 光束、飛彈、魚雷、炸彈、各式攻擊武器 |

---

## 電腦 Computers

提升武器(尤其光束)的命中率,並決定間諜與破壞行動的成功率。也是星圖偵測能力的來源。核心是逐級提升命中的**戰鬥電腦**、降低敵方飛彈命中的 **ECM 干擾器**,以及放大產能的**機器控制**。

| 中文名 | 原文 | 一句話用途 |
|---|---|---|
| 戰鬥掃描器 | Battle Scanner | 提升命中與射程偵測,可看穿隱形 |
| ECM 干擾器 I~X 型 | Ecm Jammer Mark I–X | 逐級降低敵方飛彈命中己方的機率 |
| 深空掃描器 | Deep Space Scanner | 擴大星圖偵測範圍,提早發現敵方動向 |
| 戰鬥電腦 II~XI 型 | Battle Computer Mark II–XI | 逐級提升艦船命中率,光束流派命脈 |
| 改良機器控制 III~VII | Improved Robotic Controls III–VII | 提升單一殖民者可操作的工廠數,放大產能 |
| 改良太空掃描器 | Improved Space Scanner | 進一步擴大偵測範圍 |
| 先進太空掃描器 | Advanced Space Scanner | 更高階的偵測範圍 |
| 超空間通訊 | Hyperspace Communications | 可在戰鬥中遠程指揮、調度增援 |
| 神諭介面 | Oracle Interface | 讓直射武器具備穿甲特性(飛彈/魚雷/炸彈除外) |
| 科技無效器 | Technology Nullifier | 命中可隨機降低敵艦戰鬥電腦 2~6 級 |

> 對布拉西、莫善等電腦弱的種族而言,命中率與防諜能力是長期痛點。

## 建造 Construction

降低星艦、飛彈基地、工廠的基礎建造成本,並提供裝甲材料、減廢與後勤類科技。三條主線:**改良工業技術**(降成本)、**減廢工廠**(清汙染)、**裝甲材料**(提艦體耐久);「戰鬥裝甲服/動力裝甲」等則用於提升地面戰。

| 中文名 | 原文 | 一句話用途 |
|---|---|---|
| 改良工業技術 2~9 | Improved Industrial Tech 2–9 | 逐級降低工廠建造成本,放大產能 |
| 減廢工廠 80%~20% | Reduced Industrial Waste 80%–20% | 逐級降低工廠汙染(數字越小汙染越少) |
| 工業廢棄物消除 | Industrial Waste Elimination | 完全消除工廠汙染 |
| 硬合金裝甲 | Duralloy Armor | 入門艦體裝甲材料 |
| 佐爾鋼裝甲 | Zortium Armor | 中階裝甲材料 |
| 安準裝甲 | Andrium Armor | 中高階裝甲材料 |
| 三鈦裝甲 | Tritanium Armor | 高階裝甲材料 |
| 精金裝甲 | Adamantium Armor | 高階裝甲材料 |
| 中子素裝甲 | Neutronium Armor | 頂級艦體裝甲材料 |
| 自動維修系統 | Automated Repair System | 戰鬥中自動修復受損艦體 |
| 先進損管系統 | Advanced Damage Control | 更強的戰鬥中自動修復 |
| 戰鬥裝甲服 | Battle Suits | 提升地面部隊戰力 |
| 裝甲外骨骼 | Armored Exoskeleton | 進一步提升地面部隊戰力 |
| 動力裝甲 | Powered Armor | 高階地面部隊裝甲 |

> 減廢線是中期解放產能的關鍵(矽基天生免疫汙染,不需此線)。改良工業技術整條線讓同樣生產力造出更多東西,是克拉肯、梅克拉這類生產種族的放大器。

## 力場 Force Fields

提供護盾與各種場域裝置,是防禦的核心領域。**偏導護盾**保護艦船、**行星護盾**保護殖民地,其餘為各式戰術場域裝置。

| 中文名 | 原文 | 一句話用途 |
|---|---|---|
| I~XV 級偏導護盾 | Class I–XV Deflector Shields | 艦船護盾,逐級抵減每次命中傷害 |
| V~XX 級行星護盾 | Class V–XX Planetary Shield | 保護行星不被轟炸,越高階越難打穿 |
| 個人偏導護盾 | Personal Deflector Shield | 提升地面部隊防禦 |
| 個人吸收護盾 | Personal Absorption Shield | 更強的地面部隊防禦 |
| 個人屏障護盾 | Personal Barrier Shield | 高階地面部隊防禦 |
| 斥力光束 | Repulsor Beam | 把敵艦推開,可封鎖投彈路徑 |
| 隱形裝置 | Cloaking Device | 讓艦船隱形、難以被鎖定 |
| 澤羅護盾 | Zyro Shield | 對小型武器額外減傷的場域 |
| 靜滯場 | Stasis Field | 暫時凍結敵艦使其無法行動 |
| 閃電護盾 | Lightning Shield | 對近距離飛彈有額外防禦 |
| 黑洞產生器 | Black Hole Generator | 高階場域武器,可吞噬重創敵艦 |

> 偏導護盾與行星護盾在原版有跳級的等級(如行星護盾 V/X/XV/XX),表中依引擎實際存在的項目列出。人類力場優秀、阿卡里與矽基力場差(易被轟炸)。

## 行星學 Planetology

決定你能殖民哪些行星、能把行星養多大,以及生態與生化相關能力。約一半的銀河行星屬於惡劣環境,這條線決定你能不能吃下它們。四條主線:**受控環境**(解鎖殖民惡劣星)、**地貌改造**(提人口上限)、**生態還原**(清汙染)、**生化武器/複製**(攻防與成長)。

| 中文名 | 原文 | 一句話用途 |
|---|---|---|
| 受控貧瘠/凍原/死寂/煉獄/有毒/輻射環境 | Controlled Barren/Tundra/Dead/Inferno/Toxic/Radiated Environment | 逐級解鎖殖民越來越惡劣的行星 |
| 改良地貌改造 +10~+100 | Improved Terraforming +10–+100 | 增加行星可容納的殖民人口上限 |
| 大氣地貌改造 | Atmospheric Terraforming | 改造大氣,進一步提升人口上限 |
| 完全地貌改造 | Complete Terraforming | 地貌改造的最終階,人口上限最大化 |
| 土壤改良 | Soil Enrichment | 把一般環境改成肥沃,提升人口上限 |
| 先進土壤改良 | Advanced Soil Enrichment | 把肥沃改成富饒,再提人口上限 |
| 生態還原 → 完全生態還原 | Ecological Restoration → Complete Eco Restoration | 逐級降低汙染清理成本(改良/強化/先進/完全) |
| 複製技術 / 先進複製技術 | Cloning / Advanced Cloning | 加速殖民地人口成長 |
| 死亡孢子 / 末日病毒 / 生化終結者 | Death Spores / Doom Virus / Bio Terminator | 逐級增強的生化武器,轟炸時屠殺敵方人口 |
| 生化毒素解藥 / 萬用解藥 | Bio Toxin Antidote / Universal Antidote | 抵禦敵方生化武器,保護己方人口 |

> 薩克拉、矽基、人類在這條線各有所長;惡劣行星往往是「富礦 (Rich)」,後期是造艦的本錢。受控有毒以上環境讓裝備艦可自我犧牲在惡劣行星建立殖民地。

## 推進 Propulsion

決定艦隊飛多快、射程多遠,以及多種戰術機動裝置。兩條主線:**推進引擎**(越高階曲速越快)、**燃料電池/晶體**(決定不靠補給能飛多遠,即擴張半徑);其餘為戰術機動與場域裝置。

| 中文名 | 原文 | 一句話用途 |
|---|---|---|
| 逆推引擎 | Retro Engines | 入門引擎 |
| 核子引擎 | Nuclear Engines | 低階引擎 |
| 次光速推進 | Sub-Light Drives | 中低階引擎 |
| 融合推進 | Fusion Drives | 中階引擎 |
| 脈衝推進 | Impulse Drives | 中高階引擎 |
| 離子推進 | Ion Drives | 高階引擎 |
| 反物質推進 | Anti-Matter Drives | 高階引擎 |
| 相位穿越推進 | Inter-Phased Drives | 頂級引擎 |
| 超曲速推進 | Hyper Drives | 最高階引擎,星圖移動最快 |
| 氫/氘/銥/鈾燃料電池(射程 4~8) | Hydrogen/Deuterium/Irridium/Uridium Fuel Cells | 逐級延伸艦隊不靠補給的航程 |
| 多托/三鋰晶體(射程 7/10) | Dotomite/Trilithium Crystals | 進一步延伸航程 |
| 雷傑斯 II 燃料電池(射程 9) | Reajax II Fuel Cells | 高階航程 |
| 釷燃料電池(無限射程) | Thorium Cells | 航程不再受限 |
| 備用燃料槽 | Reserve Fuel Tanks | 單艦額外攜帶燃料,延伸該艦航程 |
| 慣性穩定器 / 慣性無效器 | Inertial Stabilizer / Inertial Nullifier | 提升戰術畫面的閃避與機動 |
| 能量脈衝 / 離子脈衝 | Energy Pulsar / Ionic Pulsar | 對周圍敵艦造成範圍傷害 |
| 高能聚焦 | High Energy Focus | 大幅提升光束遠距離效能,確立光束統治後期 |
| 曲速消散器 | Warp Dissipator | 削弱敵艦進場速度 |
| 次空間傳送器 | Sub Space Teleporter | 戰術瞬移 |
| 次空間阻斷器 | Sub Space Interdictor | 在己方行星上空封鎖敵方次空間傳送 |
| 戰鬥傳送器 | Combat Transporters | 確保至少半數運兵成功登陸 |
| 星系際星門 | Intergalactic Star Gates | 己方星系間瞬間調度艦隊 |
| 位移裝置 | Displacement Device | 每回合自動隨機位移,大幅閃避攻擊 |

> 阿卡里推進成本 −40%,擴張與機動極佳;克拉肯推進差,移動偏慢。

## 武器 Weapons

提供艦載攻擊武器,分光束、飛彈、魚雷、炸彈、火箭、地面武器等大類(機制詳見 [04 艦船與戰鬥](04-ships-combat.md))。以下依類別分表。

**光束類**（靠戰鬥電腦命中,後期搭配高能聚焦最強）

| 中文名 | 原文 | 一句話用途 |
|---|---|---|
| 雷射 | Lasers | 入門光束 |
| 加特林雷射 | Gatling Laser | 多連發雷射 |
| 離子加農砲 | Ion Cannon | 中低階光束 |
| 質量投射器 | Mass Driver | 中階直射武器 |
| 中子爆破槍 | Neutron Blaster | 中階光束(3–12 傷) |
| 重力光束 | Graviton Beam | 溢出傷害會傳到下一艘艦 |
| 硬光束 | Hard Beam | 中階穿透光束 |
| 融合光束 | Fusion Beam | 中高階光束(4–16 傷) |
| 離子流投射器 | Ion Stream Projector | 高階範圍光束 |
| 百萬伏特加農砲 | Megabolt Cannon | 高階直射武器,可打穿高階行星護盾 |
| 相位砲 / 脈衝相位砲 | Phasor / Pulse Phasor | 高階光束主力 |
| 迅子光束 | Tachyon Beam | 高階長程光束 |
| 高斯機砲 | Gauss Autocannon | 高階連發直射武器 |
| 粒子光束 | Particle Beam | 高階光束 |
| 電漿加農砲 / 三焦電漿砲 | Plasma Cannon / Tri-Focus Plasma Cannon | 高階重型光束 |
| 死光 | Death Ray | 招牌頂級光束,後期決戰火力 |
| 瓦解砲 | Disruptor | 高階穿透武器 |
| 自動爆破槍 | Auto Blaster | 高階連發光束 |
| 中子流投射器 | Neutron Stream Projector | 高階範圍光束 |
| 重錘裝置 | Mauler Device | 近距必中、高傷(20–100)、範圍能量投射 |
| 恆星轉換器 | Stellar Converter | 招牌頂級武器,軌道轟擊可摧毀行星 |

**飛彈與火箭類**（早期主力,有獨立命中加成）

| 中文名 | 原文 | 一句話用途 |
|---|---|---|
| 超 V / 超 X 火箭 | Hyper-V / Hyper-X Rockets | 早期低成本火箭 |
| 反飛彈火箭 | Anti-Missile Rockets | 攔截來襲飛彈 |
| V 型散射火箭 | Scatter Pack V Rockets | 一次齊射多枚的散射火箭 |
| 麥古萊飛彈 | Merculite Missiles | 中階主力飛彈(10 傷) |
| 毒刺飛彈 | Stinger Missiles | 中高階飛彈(15 傷) |
| 脈衝飛彈 | Pulson Missiles | 高階飛彈 |
| VII/X 型散射飛彈 | Scatter Pack VII/X Missiles | 一次齊射多枚的散射飛彈 |
| 赫剌克勒斯飛彈 | Hercular Missiles | 高階重型飛彈 |
| 澤恩飛彈 | Zeon Missiles | 高階飛彈,附帶生化傷害 |

**魚雷類**（中遠程,對大型目標傷害高）

| 中文名 | 原文 | 一句話用途 |
|---|---|---|
| 反物質魚雷 | Anti-Matter Torpedoes | 中高階魚雷 |
| 地獄火魚雷 | Hellfire Torpedoes | 高階魚雷 |
| 質子魚雷 | Proton Torpedoes | 高階魚雷 |
| 電漿魚雷 | Plasma Torpedoes | 頂級魚雷 |

**炸彈類**（對行星轟炸用）

| 中文名 | 原文 | 一句話用途 |
|---|---|---|
| 融合炸彈 | Fusion Bomb | 入門轟炸炸彈 |
| 反物質炸彈 | Anti-Matter Bomb | 中階轟炸炸彈 |
| Omega-V 炸彈 | Omega-V Bomb | 高階炸彈,可打穿高階行星護盾 |
| 中子素炸彈 | Neutronium Bomb | 頂級轟炸炸彈 |

**地面/小型武器類**（提升地面部隊或作小口徑武器）

| 中文名 | 原文 | 一句話用途 |
|---|---|---|
| 手持雷射 / 手持相位砲 | Hand Lasers / Hand Phasor | 提升地面部隊攻擊 |
| 中子彈丸槍 | Neutron Pellet Gun | 小口徑直射武器 |
| 離子步槍 / 融合步槍 / 電漿步槍 | Ion / Fusion / Plasma Rifle | 逐級提升地面部隊攻擊 |

> 莫善武器優秀、命中極高;搭配電腦科技的命中流派是後期戰艦的主流。

## 科技隨機性與策略

由於每局只亮出部分科技,實務上:

- **沒看到想要的科技?** 把該領域往上推,有機會在更高層解鎖替代品;或靠**外交交換**、**間諜偷取**補齊。
- **賽隆**亮出率 75%,選擇彈性最大;一般種族要學會用手上有的牌打。
- 早期通常優先**推進 + 行星學**(擴張),中期補**建造(減廢)+ 電腦/武器/力場**(軍備),後期堆**高能聚焦 + 高階武器/護盾**收尾。

## 參考來源

- **完整科技清單(187 項)** — 從本專案引擎 `research.lbx` 萃取(`docs/translation/research_techs.tsv`),譯名見 `docs/translation/research_techs_zh.tsv`。
- 招牌科技效果(Mauler Device、Stellar Converter、Oracle Interface、Technology Nullifier、Sub Space Interdictor 等)交叉比對 StrategyWiki 與 Fandom MOO Wiki。
- StrategyWiki — Master of Orion / Technology tree: <https://strategywiki.org/wiki/Master_of_Orion/Technology_tree>
- StrategyWiki — Master of Orion / Computers: <https://strategywiki.org/wiki/Master_of_Orion/Computers>
- StrategyWiki — Master of Orion / Planetology: <https://strategywiki.org/wiki/Master_of_Orion/Planetology>
- StrategyWiki — Master of Orion / Propulsion: <https://strategywiki.org/wiki/Master_of_Orion/Propulsion>
- StrategyWiki — Master of Orion / Weapons: <https://strategywiki.org/wiki/Master_of_Orion/Weapons>
- Official Master of Orion Wiki (Fandom) — Technology tree: <https://masteroforion.fandom.com/wiki/Technology_tree>
- Steam Community Guide — Master of Orion: Planetology 101: <https://steamcommunity.com/sharedfiles/filedetails/?id=636951301>
