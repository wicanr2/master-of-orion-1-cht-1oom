# 03 六大科技領域

科技是《銀河霸主》的命脈。在這片銀河裡,武器再猛、艦隊再大,只要科技落後一個世代,就會被對手用更厚的護盾、更遠的射程、更狠的火力按在地上摩擦。整個科技體系分成六大領域,每個領域是一條由低到高的研究階梯;而本作最迷人的設計是——每場遊戲每個領域只會**隨機亮出一部分**可研究的科技(一般種族約一半,賽隆約 75%),所以沒有一條能照抄的萬用路線,你永遠得看著手上發到的牌,臨機應變。

本篇先說明科技怎麼運作,再附上**全部 187 項科技的完整清單**——每一項都列出中文名、原文與效果。這些譯名與效果文字直接取自本專案引擎的 `research.lbx`,是遊戲裡實際會看到的內容。

![遊戲中的科技研究畫面(繁體中文化)](../img/milestone-tech-cjk.png)

*科技研究畫面的繁體中文化成果:六大領域、科技名稱與效果說明全面中文化。*

## 科技等級如何計算

帝國在某個領域的「科技等級」並非單純看研究了幾項,而是:

> 取該領域**最高階科技 × 0.8**,再為每一項比它低階的已研究科技 **+1**。

每位玩家開局即擁有所有第 1 級科技,因此六大領域都從 0.8 起算(進位為 1)。這個機制鼓勵玩家穩紮穩打地往上爬,而非只衝單一高階科技。

## 六大領域總覽

| 領域 | 原文 | 一句話 | 項數 | 主要產出 |
|---|---|---|---|---|
| 電腦 | Computers | 命中與情報 | 32 | 戰鬥電腦、ECM 干擾器、深空掃描、機器控制、間諜成功率 |
| 建造 | Construction | 造得更便宜更耐打 | 25 | 降低造艦/工廠成本、裝甲材料、減廢、自動維修 |
| 力場 | Force Fields | 護盾與場域 | 24 | 偏導護盾、行星護盾、斥力光束、靜滯場、閃電護盾、隱形 |
| 行星學 | Planetology | 殖民與改造星球 | 30 | 環境控制、地貌改造、土壤改良、生化武器、複製、生態還原 |
| 推進 | Propulsion | 飛得更快更遠 | 28 | 引擎(曲速 1~9)、燃料/射程、機動裝置、傳送、高能聚焦 |
| 武器 | Weapons | 把對手打爛 | 48 | 光束、飛彈、火箭、魚雷、炸彈、地面武器 |

> 下列各領域表的中文名與效果即遊戲內實際譯文(來源:`docs/translation/research_techs_zh.tsv`、`research_descr_zh.tsv`,萃取自引擎 `research.lbx`)。同一場遊戲不會同時亮出全部科技,表中列的是該領域可能出現的所有項目。數值單位:BC = 十億信用點;秒差距為星圖距離單位。

---

## 電腦 Computers(32 項)

提升武器(尤其光束)的命中率,並決定間諜與破壞行動的成功率,也是星圖偵測能力的來源。核心三條線:逐級拉高命中的**戰鬥電腦**、降低敵方飛彈命中的 **ECM 干擾器**,以及放大產能的**機器控制**。對布拉西、莫善等電腦弱的種族而言,命中率與防諜能力是長期痛點。

| 中文名 | 原文 | 效果 |
|---|---|---|
| 戰鬥掃描器 | Battle Scanner | 在戰鬥中顯示敵方艦船的技術規格。 |
| 深空掃描器 | Deep Space Scanner | 偵測距殖民地 5 秒差距、距己方艦船 1 秒差距內的敵艦。 |
| 改良太空掃描器 | Improved Space Scanner | 偵測距殖民地 7 秒差距、距己方艦船 2 秒差距內的敵艦,並可判讀敵艦目的地與抵達時間。 |
| 先進太空掃描器 | Advanced Space Scanner | 可探索距殖民地 9 秒差距內的行星,並偵測距己方艦船 3 秒差距內的敵艦。 |
| 超空間通訊 | Hyperspace Communications | 可與超空間中的艦船與運兵船通訊,並在航行途中變更目的地。 |
| 戰鬥電腦 II 型 | Battle Computer Mark II | 武器命中提升至 2 級。 |
| 戰鬥電腦 III 型 | Battle Computer Mark III | 武器命中提升至 3 級。 |
| 戰鬥電腦 IV 型 | Battle Computer Mark IV | 武器命中提升至 4 級。 |
| 戰鬥電腦 V 型 | Battle Computer Mark V | 武器命中提升至 5 級。 |
| 戰鬥電腦 VI 型 | Battle Computer Mark VI | 武器命中提升至 6 級。 |
| 戰鬥電腦 VII 型 | Battle Computer Mark VII | 武器命中提升至 7 級。 |
| 戰鬥電腦 VIII 型 | Battle Computer Mark VIII | 武器命中提升至 8 級。 |
| 戰鬥電腦 IX 型 | Battle Computer Mark IX | 武器命中提升至 9 級。 |
| 戰鬥電腦 X 型 | Battle Computer Mark X | 武器命中提升至 10 級。 |
| 戰鬥電腦 XI 型 | Battle Computer Mark XI | 武器命中提升至 11 級。 |
| ECM 干擾器 I 型 | Ecm Jammer Mark I | 對敵方飛彈攻擊的防禦 +1 級。 |
| ECM 干擾器 II 型 | Ecm Jammer Mark II | 對敵方飛彈攻擊的防禦 +2 級。 |
| ECM 干擾器 III 型 | Ecm Jammer Mark III | 對敵方飛彈攻擊的防禦 +3 級。 |
| ECM 干擾器 IV 型 | Ecm Jammer Mark IV | 對敵方飛彈攻擊的防禦 +4 級。 |
| ECM 干擾器 V 型 | Ecm Jammer Mark V | 對敵方飛彈攻擊的防禦 +5 級。 |
| ECM 干擾器 VI 型 | Ecm Jammer Mark VI | 對敵方飛彈攻擊的防禦 +6 級。 |
| ECM 干擾器 VII 型 | Ecm Jammer Mark VII | 對敵方飛彈攻擊的防禦 +7 級。 |
| ECM 干擾器 VIII 型 | Ecm Jammer Mark VIII | 對敵方飛彈攻擊的防禦 +8 級。 |
| ECM 干擾器 IX 型 | Ecm Jammer Mark IX | 對敵方飛彈攻擊的防禦 +9 級。 |
| ECM 干擾器 X 型 | Ecm Jammer Mark X | 對敵方飛彈攻擊的防禦 +10 級。 |
| 改良機器控制 III | Improved Robotic Controls III | 每單位人口最多操作三座工廠;升級改裝費為每座工廠標準成本的一半。 |
| 改良機器控制 IV | Improved Robotic Controls IV | 每單位人口最多操作四座工廠;升級改裝費為每座工廠的標準成本。 |
| 改良機器控制 V | Improved Robotic Controls V | 每單位人口最多操作五座工廠;升級改裝費為標準成本的 1.5 倍。 |
| 改良機器控制 VI | Improved Robotic Controls VI | 每單位人口最多操作六座工廠;升級改裝費為標準成本的 2 倍。 |
| 改良機器控制 VII | Improved Robotic Controls VII | 每單位人口最多操作七座工廠;升級改裝費為標準成本的 2.5 倍。 |
| 神諭介面 | Oracle Interface | 將所有光束武器協同為一次同步集中齊射,使敵方護盾強度減半。 |
| 科技無效器 | Technology Nullifier | 擾亂敵方戰鬥電腦,每次發射降低其電腦 2 至 6 級。射程 4 格。 |

---

## 建造 Construction(25 項)

降低星艦、飛彈基地、工廠的基礎建造成本,並提供裝甲材料、減廢與後勤類科技。三條主線:**改良工業技術**(降成本)、**減廢工廠**(清汙染)、**裝甲材料**(提艦體耐久);「戰鬥裝甲服/動力裝甲」等則用於提升地面戰。減廢線是中期解放產能的關鍵(矽基天生免疫汙染,跳過此線)。

| 中文名 | 原文 | 效果 |
|---|---|---|
| 改良工業技術 2 | Improved Industrial Tech 2 | 將每座工廠的建造成本降至 2 BC。 |
| 改良工業技術 3 | Improved Industrial Tech 3 | 將每座工廠的建造成本降至 3 BC。 |
| 改良工業技術 4 | Improved Industrial Tech 4 | 將每座工廠的建造成本降至 4 BC。 |
| 改良工業技術 5 | Improved Industrial Tech 5 | 將每座工廠的建造成本降至 5 BC。 |
| 改良工業技術 6 | Improved Industrial Tech 6 | 將每座工廠的建造成本降至 6 BC。 |
| 改良工業技術 7 | Improved Industrial Tech 7 | 將每座工廠的建造成本降至 7 BC。 |
| 改良工業技術 8 | Improved Industrial Tech 8 | 將每座工廠的建造成本降至 8 BC。 |
| 改良工業技術 9 | Improved Industrial Tech 9 | 將每座工廠的建造成本降至 9 BC。 |
| 減廢工廠 80% | Reduced Industrial Waste 80% | 將工廠汙染量降至正常值的 80%。 |
| 減廢工廠 60% | Reduced Industrial Waste 60% | 將工廠汙染量降至正常值的 60%。 |
| 減廢工廠 40% | Reduced Industrial Waste 40% | 將工廠汙染量降至正常值的 40%。 |
| 減廢工廠 20% | Reduced Industrial Waste 20% | 將工廠汙染量降至正常值的 20%。 |
| 工業廢棄物消除 | Industrial Waste Elimination | 工廠不再產生汙染。 |
| 硬合金裝甲 | Duralloy Armor | 艦船與運兵船生命值 +50%;個人戰鬥裝甲地面攻擊 +5。 |
| 佐爾鋼裝甲 | Zortium Armor | 艦船與運兵船生命值 +100%;個人戰鬥裝甲地面攻擊 +10。 |
| 安準裝甲 | Andrium Armor | 艦船與運兵船生命值 +150%;個人戰鬥裝甲地面攻擊 +15。 |
| 三鈦裝甲 | Tritanium Armor | 艦船與運兵船生命值 +200%;個人戰鬥裝甲地面攻擊 +20。 |
| 精金裝甲 | Adamantium Armor | 艦船與運兵船生命值 +250%;個人戰鬥裝甲地面攻擊 +25。 |
| 中子素裝甲 | Neutronium Armor | 現有最佳內部防護,艦船生命值 +300%;地面攻擊 +30。 |
| 自動維修系統 | Automated Repair System | 未被擊毀的艦船每回合結束時修復至多 15% 總生命值。 |
| 先進損管系統 | Advanced Damage Control | 未被擊毀的艦船每回合結束時修復至多 30% 總生命值。 |
| 備用燃料槽 | Reserve Fuel Tanks | 使艦船航程額外延伸 3 秒差距。 |
| 戰鬥裝甲服 | Battle Suits | 兼具防護與增力,所有地面戰判定 +10。 |
| 裝甲外骨骼 | Armored Exoskeleton | 先進動力裝甲服,賦予地面部隊有限飛行;地面戰判定 +20。 |
| 動力裝甲 | Powered Armor | 結合高機動、反重力飛行與重裝甲板,地面戰判定 +30。 |

---

## 力場 Force Fields(24 項)

提供護盾與各種場域裝置,是防禦的核心領域。**偏導護盾**保護艦船(逐級抵減每次命中傷害)、**行星護盾**保護殖民地不被轟炸,其餘為各式戰術場域裝置。人類力場優秀;阿卡里與矽基力場差,行星易被轟炸。

| 中文名 | 原文 | 效果 |
|---|---|---|
| I 級偏導護盾 | Class I Deflector Shields | 吸收所有攻擊 1 點傷害。 |
| II 級偏導護盾 | Class II Deflector Shields | 吸收所有攻擊 2 點傷害。 |
| III 級偏導護盾 | Class III Deflector Shields | 吸收所有攻擊 3 點傷害。 |
| IV 級偏導護盾 | Class IV Deflector Shields | 吸收所有攻擊 4 點傷害。 |
| V 級偏導護盾 | Class V Deflector Shields | 吸收所有攻擊 5 點傷害。 |
| VI 級偏導護盾 | Class VI Deflector Shields | 吸收所有攻擊 6 點傷害。 |
| VII 級偏導護盾 | Class VII Deflector Shields | 吸收所有攻擊 7 點傷害。 |
| IX 級偏導護盾 | Class IX Deflector Shields | 吸收所有攻擊 9 點傷害。 |
| XI 級偏導護盾 | Class XI Deflector Shields | 吸收所有攻擊 11 點傷害。 |
| XIII 級偏導護盾 | Class XIII Deflector Shields | 吸收所有攻擊 13 點傷害。 |
| XV 級偏導護盾 | Class XV Deflector Shields | 吸收所有攻擊 15 點傷害。 |
| V 級行星護盾 | Class V Planetary Shield | 吸收對行星表面攻擊 5 點傷害,可與飛彈基地偏導護盾疊加。 |
| X 級行星護盾 | Class X Planetary Shield | 吸收對行星表面攻擊 10 點傷害,可與飛彈基地偏導護盾疊加。 |
| XV 級行星護盾 | Class XV Planetary Shield | 吸收對行星表面攻擊 15 點傷害,可與飛彈基地偏導護盾疊加。 |
| XX 級行星護盾 | Class XX Planetary Shield | 吸收對行星表面攻擊 20 點傷害,可與飛彈基地偏導護盾疊加。 |
| 個人偏導護盾 | Personal Deflector Shield | 以定向力場保護地面部隊,所有地面戰判定 +10。 |
| 個人吸收護盾 | Personal Absorption Shield | 吸收所有手持武器傷害,所有地面戰判定 +20。 |
| 個人屏障護盾 | Personal Barrier Shield | 以近乎無法穿透的力場包覆士兵,所有地面戰判定 +30。 |
| 斥力光束 | Repulsor Beam | 將敵艦推離本艦一格。特殊武器,射程 1 格。 |
| 隱形裝置 | Cloaking Device | 使艦船在發動攻擊前近乎隱形;隱形期間飛彈與光束防禦 +5。 |
| 澤羅護盾 | Zyro Shield | 摧毀來襲飛彈與魚雷的能量場,成功率 75%,每級飛彈科技 -1%。 |
| 閃電護盾 | Lightning Shield | 摧毀來襲飛彈與魚雷的能量場,成功率 100%,每級飛彈科技 -1%。 |
| 靜滯場 | Stasis Field | 將一格內的一組敵艦凍結一回合;凍結艦無法攻擊也無法被攻擊。 |
| 黑洞產生器 | Black Hole Generator | 生成瞬間黑洞,摧毀 25%-100% 的敵艦,每級護盾 -2%。 |

---

## 行星學 Planetology(30 項)

決定你能殖民哪些行星、能把行星養多大,以及生態與生化相關能力。約一半的銀河行星屬於惡劣環境,這條線決定你能不能吃下它們——而惡劣星往往是富礦,後期是造艦的本錢。四條主線:**受控環境**(解鎖殖民惡劣星)、**地貌改造**(提人口上限)、**生態還原**(清汙染)、**生化武器/複製**(攻防與成長)。

| 中文名 | 原文 | 效果 |
|---|---|---|
| 受控貧瘠環境 | Controlled Barren Environment | 允許殖民貧瘠行星。 |
| 受控凍原環境 | Controlled Tundra Environment | 允許殖民凍原行星。 |
| 受控死寂環境 | Controlled Dead Environment | 允許殖民死寂行星。 |
| 受控煉獄環境 | Controlled Inferno Environment | 允許殖民煉獄行星。 |
| 受控有毒環境 | Controlled Toxic Environment | 允許殖民有毒行星。 |
| 受控輻射環境 | Controlled Radiated Environment | 允許殖民輻射行星。 |
| 改良地貌改造 +10 | Improved Terraforming +10 | 行星人口容量 +1000 萬,每百萬人口成本 5 BC。 |
| 改良地貌改造 +20 | Improved Terraforming +20 | 行星人口容量 +2000 萬,每百萬人口成本 5 BC。 |
| 改良地貌改造 +30 | Improved Terraforming +30 | 行星人口容量 +3000 萬,每百萬人口成本 4 BC。 |
| 改良地貌改造 +40 | Improved Terraforming +40 | 行星人口容量 +4000 萬,每百萬人口成本 4 BC。 |
| 改良地貌改造 +50 | Improved Terraforming +50 | 行星人口容量 +5000 萬,每百萬人口成本 3 BC。 |
| 改良地貌改造 +60 | Improved Terraforming +60 | 行星人口容量 +6000 萬,每百萬人口成本 3 BC。 |
| 改良地貌改造 +80 | Improved Terraforming +80 | 行星人口容量 +8000 萬,每百萬人口成本 2 BC。 |
| 改良地貌改造 +100 | Improved Terraforming +100 | 行星人口容量 +1 億,每百萬人口成本 2 BC。 |
| 完全地貌改造 | Complete Terraforming | 行星人口容量 +1.2 億,每百萬人口成本 2 BC。 |
| 大氣地貌改造 | Atmospheric Terraforming | 以一次性 200 BC,將惡劣行星改造為一般環境,人口成長恢復正常。 |
| 土壤改良 | Soil Enrichment | 以一次性 150 BC,將一般行星改造為肥沃,人口成長 +50%、基礎容量 +25%。 |
| 先進土壤改良 | Advanced Soil Enrichment | 以一次性 300 BC,將一般與肥沃行星改造為樂土,人口成長加倍、基礎容量 +50%。 |
| 生態還原 | Ecological Restoration | 以 1 BC 清除 2 單位工業廢棄物。 |
| 改良生態還原 | Improved Eco Restoration | 以 1 BC 清除 3 單位工業廢棄物。 |
| 強化生態還原 | Enhanced Eco Restoration | 以 1 BC 清除 5 單位工業廢棄物。 |
| 先進生態還原 | Advanced Eco Restoration | 以 1 BC 清除 10 單位工業廢棄物。 |
| 完全生態還原 | Complete Eco Restoration | 以 1 BC 清除 20 單位工業廢棄物。 |
| 複製技術 | Cloning | 培育生物工程殖民者,每 10 BC 產出 100 萬人口。 |
| 先進複製技術 | Advanced Cloning | 培育生物工程殖民者,每 5 BC 產出 100 萬人口。 |
| 死亡孢子 | Death Spores | 生化武器,每次攻擊使行星最大人口減少 100 萬。 |
| 末日病毒 | Doom Virus | 生化武器,每次攻擊使行星人口減少 200 萬。 |
| 生化終結者 | Bio Terminator | 生化武器,每次攻擊使行星人口減少 300 萬。 |
| 生化毒素解藥 | Bio Toxin Antidote | 使每次生化武器攻擊造成的傷亡減少 100 萬。 |
| 萬用解藥 | Universal Antidote | 使每次生化武器攻擊造成的傷亡減少 200 萬。 |

---

## 推進 Propulsion(28 項)

決定艦隊飛多快、射程多遠,以及多種戰術機動裝置。兩條主線:**推進引擎**(越高階曲速越快、戰鬥機動上限越高)、**燃料電池/晶體**(決定不靠補給能飛多遠,即擴張半徑);其餘為戰術機動與場域裝置。阿卡里推進成本 −40%,擴張與機動極佳;克拉肯推進差,移動偏慢。

| 中文名 | 原文 | 效果 |
|---|---|---|
| 逆推引擎 | Retro Engines | 曲速一(每回合 1 秒差距),戰鬥最高機動 I 級。 |
| 核子引擎 | Nuclear Engines | 曲速二(每回合 2 秒差距),戰鬥最高機動 II 級。 |
| 次光速推進 | Sub-Light Drives | 曲速三(每回合 3 秒差距),戰鬥最高機動 III 級。 |
| 融合推進 | Fusion Drives | 曲速四(每回合 4 秒差距),戰鬥最高機動 IV 級。 |
| 脈衝推進 | Impulse Drives | 曲速五(每回合 5 秒差距),戰鬥最高機動 V 級。 |
| 離子推進 | Ion Drives | 曲速六(每回合 6 秒差距),戰鬥最高機動 VI 級。 |
| 反物質推進 | Anti-Matter Drives | 曲速七(每回合 7 秒差距),戰鬥最高機動 VII 級。 |
| 相位穿越推進 | Inter-Phased Drives | 曲速八(每回合 8 秒差距),戰鬥最高機動 VIII 級。 |
| 超曲速推進 | Hyper Drives | 曲速九(每回合 9 秒差距),戰鬥最高機動 IX 級。 |
| 氫燃料電池(射程 4) | Hydrogen Fuel Cells | 燃料儲備使艦船可離開殖民行星至多 4 秒差距。 |
| 氘燃料電池(射程 5) | Deuterium Fuel Cells | 燃料儲備使艦船可離開殖民行星至多 5 秒差距。 |
| 銥燃料電池(射程 6) | Irridium Fuel Cells | 燃料儲備使艦船可離開殖民行星至多 6 秒差距。 |
| 多托晶體(射程 7) | Dotomite Crystals | 燃料儲備使艦船可離開殖民行星至多 7 秒差距。 |
| 鈾燃料電池(射程 8) | Uridium Fuel Cells | 燃料儲備使艦船可離開殖民行星至多 8 秒差距。 |
| 雷傑斯 II 燃料電池(射程 9) | Reajax II Fuel Cells | 燃料儲備使艦船可離開殖民行星至多 9 秒差距。 |
| 三鋰晶體(射程 10) | Trilithium Crystals | 燃料儲備使艦船可離開殖民行星至多 10 秒差距。 |
| 釷燃料電池(無限射程) | Thorium Cells | 可自我補充的燃料,使艦船能離開殖民行星任意距離。 |
| 慣性穩定器 | Inertial Stabilizer | 降低慣性,戰鬥機動 +2 級(防禦 +2、戰鬥速度 +1)。 |
| 慣性無效器 | Inertial Nullifier | 抵銷慣性,戰鬥機動 +2 級(防禦 +4、戰鬥速度 +2)。 |
| 能量脈衝 | Energy Pulsar | 引擎改裝,球形能量爆發,對相鄰艦船至多 5 點傷害,每兩艘敵艦 +1。 |
| 離子脈衝 | Ionic Pulsar | 引擎改裝,球形相位能量爆發,對相鄰艦船至多 10 點傷害,每艘敵艦 +1。 |
| 高能聚焦 | High Energy Focus | 使所有能量武器的射程 +3。是確立光束統治後期的關鍵裝置。 |
| 曲速消散器 | Warp Dissipator | 專用武器,擾亂敵艦曲速場,每次發射使其速度降低 0 至 1。 |
| 次空間傳送器 | Sub Space Teleporter | 將艦船傳送至戰鬥地圖任一格,並使該艦取得最高先攻。 |
| 次空間阻斷器 | Sub Space Interdictor | 以重力井環繞殖民行星,使敵方次空間傳送失效、戰鬥傳送效果減半;配置於所有飛彈基地。 |
| 戰鬥傳送器 | Combat Transporters | 運兵船有 50% 機率在被攻擊前先傳送登陸敵方表面。 |
| 星系際星門 | Intergalactic Star Gates | 任兩座裝有星門的行星間僅花一回合移動。建造成本 3000 BC。 |
| 位移裝置 | Displacement Device | 隨機在正常空間中進出,可閃避三分之一的非範圍攻擊。 |

---

## 武器 Weapons(48 項)

最龐大也最精彩的領域,提供艦載與地面的全部攻擊手段。節奏上有個鐵律:**飛彈與魚雷主宰早中期,光束主宰後期**——光束靠戰鬥電腦命中,搭配高能聚焦後遠距離輸出最穩。莫善武器優秀、命中極高,是這條線的天生玩家。以下依類別分表(光束 / 飛彈火箭 / 魚雷 / 炸彈 / 地面),每一項都列出。

**光束類**(直射能量武器,靠戰鬥電腦命中)

| 中文名 | 原文 | 效果 |
|---|---|---|
| 雷射 | Lasers | 直射光束,造成 1-4 點傷害;重型雷射射程 2 格、1-7 點。 |
| 加特林雷射 | Gatling Laser | 先進雷射,每回合最多發射四次,每次 1-4 點傷害。 |
| 中子彈丸槍 | Neutron Pellet Gun | 重型粒子流,使敵方偏導護盾減半,造成 2-5 點傷害。 |
| 離子加農砲 | Ion Cannon | 高強度光束,造成 3-8 點傷害;重型 3-15 點、射程 2 格。 |
| 質量投射器 | Mass Driver | 線性加速器,使敵方偏導護盾減半,造成 5-8 點傷害。 |
| 中子爆破槍 | Neutron Blaster | 高功率光束,造成 3-12 點傷害;重型 3-24 點、射程 2 格。 |
| 重力光束 | Graviton Beam | 牽引斥力光束,造成 1-15 點傷害;傷害可從一艘艦溢出至下一艘。 |
| 硬光束 | Hard Beam | 能量轉物質光束,使敵方偏導護盾減半,造成 8-12 點傷害。 |
| 融合光束 | Fusion Beam | 高強度光束,造成 4-16 點傷害;重型 4-30 點、射程 2 格。 |
| 離子流投射器 | Ion Stream Projector | 強烈離子爆能,使敵方裝甲 -20%,每兩艘發射艦 +1%;射程 2 格。 |
| 百萬伏特加農砲 | Megabolt Cannon | 寬廣範圍多道能量束,命中率 +30%,造成 2-20 點傷害。 |
| 相位砲 | Phasor | 相位能量光束,造成 5-20 點傷害;重型 5-40 點、射程 2 格。 |
| 自動爆破槍 | Auto Blaster | 先進中子爆破槍,每回合最多發射三次,每次 4-16 點傷害。 |
| 迅子光束 | Tachyon Beam | 強烈迅子粒子流,造成 1-25 點傷害;傷害可溢出至下一艘艦。 |
| 高斯機砲 | Gauss Autocannon | 先進線性加速器,每回合四發爆裂彈,每發 7-10 點;使敵方護盾減半。 |
| 粒子光束 | Particle Beam | 高強度粒子加速器,造成 10-20 點傷害,並使偏導護盾減半。 |
| 電漿加農砲 | Plasma Cannon | 強烈能量束,造成 6-30 點傷害。 |
| 死光 | Death Ray | 具難以置信破壞力的遠古武器,造成 200-1000 點傷害,射程 1 格。 |
| 瓦解砲 | Disruptor | 巨大純能量束,可打擊 2 格內目標,造成 10-40 點傷害。 |
| 脈衝相位砲 | Pulse Phasor | 先進相位砲,每回合三連射,每次 5-20 點傷害。 |
| 三焦電漿砲 | Tri-Focus Plasma Cannon | 三道高強度電漿光束,造成 20-50 點傷害。 |
| 恆星轉換器 | Stellar Converter | 物質-能量轉換場包圍目標,造成四次 10-35 點攻擊;射程 3 格(軌道轟擊可摧毀行星)。 |
| 中子流投射器 | Neutron Stream Projector | 集中微中子射線爆能,使敵方裝甲 -40%,每艘發射艦 +1%;射程 2 格。 |
| 重錘裝置 | Mauler Device | 向目標釋放巨量聚焦能量,造成 20-100 點傷害(近距必中)。 |

**飛彈與火箭類**(自走武器,有獨立命中加成,早中期主力)

| 中文名 | 原文 | 效果 |
|---|---|---|
| 超 V 火箭 | Hyper-V Rockets | 高速飛彈,爆炸 6 點傷害,速度 2.5。 |
| 超 X 火箭 | Hyper-X Rockets | 高能彈頭飛彈,爆炸 8 點傷害,速度 2.5,由 +1 級導引電腦控制。 |
| 反飛彈火箭 | Anti-Missile Rockets | 超光速火箭,摧毀來襲飛彈,成功率 40%,每級飛彈科技 -1%。 |
| V 型散射火箭 | Scatter Pack V Rockets | 超 V 火箭分導版,分裂五枚彈頭,每枚 6 點傷害,速度 2.5。 |
| 麥古萊飛彈 | Merculite Missiles | 強勁高速飛彈,爆炸 10 點傷害,速度 3,由 +2 級導引電腦控制。 |
| 毒刺飛彈 | Stinger Missiles | 緩慢但極精準,造成 15 點傷害,速度 3.5,由 +3 級導引電腦控制。 |
| 脈衝飛彈 | Pulson Missiles | 反物質彈頭強力飛彈,爆炸 20 點傷害,速度 4,由 +4 級導引電腦控制。 |
| VII 型散射飛彈 | Scatter Pack VII Missiles | 超 X 火箭分導版,分裂七枚彈頭,每枚 10 點傷害,速度 3,由 +2 級導引電腦控制。 |
| 赫剌克勒斯飛彈 | Hercular Missiles | 高度先進飛彈,爆炸 25 點傷害,速度 4.5,由 +5 級導引電腦控制。 |
| 澤恩飛彈 | Zeon Missiles | 現有最先進飛彈,造成 30 點傷害,速度 5,由 +6 級導引電腦導引。 |
| X 型散射飛彈 | Scatter Pack X Missiles | 毒刺飛彈分導版,分裂十枚彈頭,每枚 15 點傷害,速度 3.5,由 +3 級導引電腦控制。 |

**魚雷類**(中遠程,對大型目標傷害高)

| 中文名 | 原文 | 效果 |
|---|---|---|
| 反物質魚雷 | Anti-Matter Torpedoes | 高能追蹤魚雷,造成 30 點傷害,每隔一回合發射;配 +4 級導引電腦。 |
| 地獄火魚雷 | Hellfire Torpedoes | 包覆式能量魚雷,同時命中所有護盾,相當於四次 25 點攻擊;每隔一回合發射。 |
| 質子魚雷 | Proton Torpedoes | 高當量能量魚雷,造成 75 點傷害,每隔一回合發射;配 +6 級導引電腦。 |
| 電漿魚雷 | Plasma Torpedoes | 純能量魚雷,造成 150 點傷害,每飛行一格損失 15 點威力;配 +7 級導引電腦。 |

**炸彈類**(對行星轟炸)

| 中文名 | 原文 | 效果 |
|---|---|---|
| 融合炸彈 | Fusion Bomb | 僅對行星目標爆炸,造成 5-20 點傷害。 |
| 反物質炸彈 | Anti-Matter Bomb | 僅對行星目標爆炸,造成 10-40 點傷害。 |
| Omega-V 炸彈 | Omega-V Bomb | 高當量炸彈,僅對行星目標爆炸,造成 20-50 點傷害。 |
| 中子素炸彈 | Neutronium Bomb | 毀滅性炸彈,僅對行星爆炸,造成 40-70 點傷害。 |

**地面與小型武器類**(提升地面部隊或作小口徑武器)

| 中文名 | 原文 | 效果 |
|---|---|---|
| 手持雷射 | Hand Lasers | 個人雷射,地面戰判定 +5。 |
| 離子步槍 | Ion Rifle | 個人光束武器,地面攻擊 +10。 |
| 融合步槍 | Fusion Rifle | 命中不佳但威力驚人的光束武器,地面戰判定 +20。 |
| 手持相位砲 | Hand Phasor | 強力手持能量武器,可將敵人分解為原子,地面戰判定 +25。 |
| 電漿步槍 | Plasma Rifle | 現有最具毀滅性的手持武器,地面攻擊 +30。 |

---

## 科技隨機性與策略

由於每局只亮出部分科技,實務上:

- **沒看到想要的科技?** 把該領域往上推,有機會在更高層解鎖替代品;或靠**外交交換**、**間諜偷取**補齊。
- **賽隆**亮出率 75%,選擇彈性最大;一般種族要學會用手上有的牌打。
- 早期通常優先**推進 + 行星學**(擴張),中期補**建造(減廢)+ 電腦/武器/力場**(軍備),後期堆**高能聚焦 + 高階武器/護盾**收尾。

> 想看這些科技在實戰中怎麼搭配成艦隊,見 [04 艦船與戰鬥](04-ships-combat.md);想知道該照什麼順序研究,見 [05 策略](05-strategy.md)。

## 參考來源

- **完整科技清單(187 項)** — 從本專案引擎 `research.lbx` 萃取(`docs/translation/research_techs.tsv`),譯名與效果見 `docs/translation/research_techs_zh.tsv`、`research_descr_zh.tsv`。
- 招牌科技效果(Mauler Device、Stellar Converter、Oracle Interface、Technology Nullifier、Sub Space Interdictor 等)交叉比對 StrategyWiki 與 Fandom MOO Wiki。
- StrategyWiki — Master of Orion / Technology tree: <https://strategywiki.org/wiki/Master_of_Orion/Technology_tree>
- StrategyWiki — Master of Orion / Computers: <https://strategywiki.org/wiki/Master_of_Orion/Computers>
- StrategyWiki — Master of Orion / Planetology: <https://strategywiki.org/wiki/Master_of_Orion/Planetology>
- StrategyWiki — Master of Orion / Propulsion: <https://strategywiki.org/wiki/Master_of_Orion/Propulsion>
- StrategyWiki — Master of Orion / Weapons: <https://strategywiki.org/wiki/Master_of_Orion/Weapons>
- Official Master of Orion Wiki (Fandom) — Technology tree: <https://masteroforion.fandom.com/wiki/Technology_tree>
