# 04 艦船與戰鬥

在《銀河霸主》裡,科技最終要透過艦隊轉化成戰力。本作把「設計艦船」和「指揮戰鬥」分成兩個層面:你在艦船設計畫面把研究來的武器、護盾、引擎、特殊裝置裝進不同尺寸的艦體,再到回合制戰術畫面操控艦隊作戰。本篇介紹艦體、武器類型、特殊裝置與命中/防禦的基本機制。

## 艦體尺寸

艦船分四種尺寸,越大可裝的裝備越多、越耐打,但越貴、造得越慢。

| 尺寸 | 原文 | 特性 |
|---|---|---|
| 小型 | Small | 便宜量大,但脆;後期幾乎一發就掛 |
| 中型 | Medium | 早中期主力,均衡 |
| 大型 | Large | 載重高、能扛能打 |
| 巨型 | Huge | 後期決戰主力,空間最大,可堆滿重武器與厚護盾 |

> 通則:**小型艦中後期形同消耗品**——任何一發命中幾乎必殺;大型與巨型艦則能連吃多發才沉。早期可用小型艦灌數量,後期則靠少數重艦決勝。

## 武器類型

武器大致分四類,各有射程、命中與用途上的差異。

### 光束 (Beam Weapons)

直射能量武器,命中率取決於**戰鬥電腦**,後期搭配**高能聚焦 (High Energy Focus)** 可消除遠距離劣勢,成為後期戰場的主宰。

| 武器 | 傷害 | 射程(空格) |
|---|---|---|
| 中子爆破槍 Neutron Blaster | 3–12 | 1 |
| 重型中子爆破槍 Heavy Neutron Blaster | 3–24 | 2 |
| 融合光束 Fusion Beam | 4–16 | 1 |
| 重型融合光束 Heavy Fusion Beam | 4–30 | 2 |
| 重力光束 Graviton Beam | 1–15 | 溢出傷害會傳到下一艘艦 |

> 一般光束最大有效射程約 23 格,重型版本約 50 格。重型版傷害與射程都加倍,但佔用空間更大。

### 飛彈 (Missiles)

自走武器,有獨立的命中加成,是**早期到中期的主力**。命中後即造成固定傷害,但會被 ECM 干擾。

| 武器 | 傷害 | 命中加成 |
|---|---|---|
| 麥古萊飛彈 Merculite Missile | 10 | +2 攻擊等級 |
| 毒刺飛彈 Stinger Missile | 15 | +3 攻擊等級 |

> 飛彈射程約 60,介於多數光束與魚雷之間。飛彈數量有限(一艘艦帶的彈藥會打完),適合速戰速決。

### 魚雷 (Torpedoes)

中遠程武器,對大型目標傷害高,適合打硬殼艦與行星設施。射程通常比飛彈更遠。

### 炸彈 (Bombs)

專門對行星轟炸(削減人口與設施)。要打穿高階**行星防護罩 (Planetary Shield)**,需要夠強的炸彈——例如 **Omega-V 炸彈**、重型融合光束、巨炮級武器才能突破 Class V 護盾。

### 頂級武器

- **恆星轉換器 (Stellar Converter)** — 系列最強武器之一,威力足以重創乃至摧毀目標。
- **死光 (Death Ray)** — 高階光束,後期決戰級火力。

> 節奏總結:**飛彈/魚雷主宰早期,光束主宰後期**;後期光束流派(戰鬥電腦 + 高能聚焦)是主流最佳解。

## 特殊裝置

除了武器與護盾,艦船可裝載多種戰術裝置(多來自力場與推進科技):

- **斥力光束 (Repulsor Beam)** — 把敵艦推開;兩艘放行星兩側可封鎖投彈路徑。
- **靜滯場 (Stasis Field)** — 凍結敵艦使其無法行動。
- **次空間傳送 (Subspace Teleporter)** — 戰術瞬移。
- **脈衝 (Pulsar)** — 範圍傷害。
- **隱形裝置 (Cloaking Device)** — 隱形難鎖。
- **自動維修單元 (Automated Repair Unit)** — 戰鬥中回血。
- **ECM 干擾器 (ECM Jammer)** — 降低敵方飛彈命中己方。

## 命中與防禦機制

戰鬥傷害由**攻擊判定 (attack roll)** 決定:

1. 系統擲一個 **1~100** 的隨機數。
2. 加上攻擊方的**戰鬥電腦/武器命中加成**。
3. 減去防守方的**機動力 (maneuverability)** 等級。
4. **每件武器各自擲一次**——一艘裝 10 門雷射的艦,就有 10 次獨立判定。

防禦面有兩大支柱:

- **護盾 (Shield)** — 偏導護盾 (Deflector Shield, Class I~X) 直接抵減每次命中的傷害。
- **裝甲 (Armor / Hull)** — 提升艦船總血量(hit points)。每種材料有「標準」與「雙層 (double hull, 顯示為 II)」兩版,雙層血更厚但更佔空間。
- **機動力與 ECM** — 機動力同時提升對光束與飛彈的閃避;ECM 額外降低飛彈命中率(飛彈防禦 = 一般防禦 + ECM 值)。

> 種族影響:莫善攻擊 +4、命中極高;阿卡里光束/飛彈防禦各 +3、極難命中;矽基/阿卡里力場弱,行星易被轟。

## 艦船設計要點

- **配平角色**:不要一艘艦塞滿所有東西。常見作法是分工——主力炮艦堆武器+電腦,護衛艦帶 ECM/斥力光束/維修,專職轟炸艦帶炸彈。
- **電腦配光束**:用光束就一定要堆戰鬥電腦,否則命中慘不忍睹。
- **後期上高能聚焦**:確立光束遠距離輸出。
- **行星防禦**:飛彈基地 (Missile Base) + 行星護盾,搭配斥力光束封鎖,可讓殖民地極難被攻陷。

## 參考來源

- StrategyWiki — Master of Orion / Attack roll: <https://strategywiki.org/wiki/Master_of_Orion/Attack_roll>
- StrategyWiki — Master of Orion / Warship design: <https://strategywiki.org/wiki/Master_of_Orion/Warship_design>
- StrategyWiki — Master of Orion / Weapons: <https://strategywiki.org/wiki/Master_of_Orion/Weapons>
- StrategyWiki — Master of Orion / General battle tactics: <https://strategywiki.org/wiki/Master_of_Orion/General_battle_tactics>
- StrategyWiki — Master of Orion / Winning with beam weapons: <https://strategywiki.org/wiki/Master_of_Orion/Winning_with_beam_weapons>
- GameFAQs — Master of Orion 1+2 Weapon Calculations FAQ (Gontzol): <https://gamefaqs.gamespot.com/pc/610418-master-of-orion-12/faqs/16743>
