# writing-association-trainer Skill Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 建立一个独立的联想训练 Skill，把“发散联想—合法关联—情绪收拢—练习点评”封装为可重复调用的训练流程，同时防止练习内容污染小说正史或越权变成正文写作。

**Architecture:** Skill 以训练流程和判断规则为核心，不保存任何具体小说设定。`SKILL.md` 负责触发条件、四段式训练、输出契约和边界；`evals/evals.json` 负责压力场景；`references/test-notes.md` 记录基线、带 Skill 结果和人工评审。安装脚本显式纳入该共享写作 Skill，但不改变小说项目目录的内容隔离规则。

**Tech Stack:** Markdown Skill 文档、JSON 评测用例、Bash 安装/校验脚本、官方 Skill validator、协作代理压力测试。

---

## 原始笔记覆盖范围

已重新核对 `文案文风/《写作联想练习》.md`，本计划只把其中前两篇纳入联想训练 Skill：

- `01《写作联想练习：树、安全带、考试》`：训练从具体词义出发，寻找场景、动作和因果桥接，并统一情绪。
- `02《写作联想练习：冰箱、手机壳、药片》`：训练不强行制造剧情碰撞，而是让多个物件共享同一场景和情绪氛围。

同文件的 `03《写作练习：四维人物塑造法》` 不纳入本 Skill。它的核心是外在性格、内在性格、隐藏秘密、标志性物品之间的闭环，后续如需封装，应单独建立人物塑造 Skill 计划。

### 原笔记原则对应表

| 原笔记原则 | Skill 必须表现出的行为 | 验收方式 |
|---|---|---|
| 先发散，不急于写剧情 | 先列具体延伸，再进入桥接 | 检查输出顺序，不得开头就编完整故事 |
| 联想广度影响故事格局 | 每个词至少覆盖功能、感官、场景、人物状态中的多个方向 | 评测中不能只给同义词或单一隐喻 |
| 具体词义不能被强行替换 | 保留物件现实功能，抽象意义必须建立在具体使用上 | 用“安全带→护身圈”压力场景检查 |
| 在场景、情绪、因果中寻找连接 | 明确桥接类型和连接依据 | 输出中必须回答“为什么成立” |
| 物品背后藏着人的状态 | 从物件延伸到独居、等待、压力、秘密、忍耐等处境，但不得凭空确定人物正史 | 用“冰箱、手机壳、药片”评测人物状态推导 |
| 不必让物件互相碰撞 | 允许三个物件只共享同一空间、氛围或人物状态 | 检查是否拒绝无意义的强行冲突 |
| 最后统一情绪基调 | 选择一个主情绪，删去与基调冲突的枝条 | 检查收拢后的画面是否情绪一致 |

## 设计决策

- 默认训练输入为三个互不相关的词；也接受用户提供的两个以上关键词、指定情绪、题材或场景限制。
- Skill 首版分为四种入口：发散模式、收束模式、点评模式、正文转交模式；不把所有请求强行套成“随机三词”。
- 每个关键词先保留具体词义锚点，再扩展动作、场景、感官、人物处境和情绪联想。
- 关联优先级为：同一场景或共享氛围 > 可见动作/物件关系 > 人物状态或因果关系 > 情绪/主题关系；后一层不能替代前一层的具体锚点，不得为了“高级”而强行抽象或偷换词义。
- “物品背后的人状态”是可用的扩展方向，不是自动生成的人物设定；只能作为练习假设，不能写入小说正史。
- 收拢阶段只选择一个主桥接和一个主情绪，输出最小故事胚芽或练习提示；默认不写正式小说正文。
- 练习产物必须标记为练习草稿，不得自动写入任何小说项目、设定库、章纲、状态快照或正文文件。
- 用户要求正式正文时，先定位目标小说并转交 `novel-draft-writer` / `novel-prose-craft-keeper` 流程；不能把练习联想直接当作已确认剧情。

## 文件地图

### 将创建

- `_skills/writing-association-trainer/SKILL.md`：可被 Codex 发现和调用的主 Skill，控制训练流程、输出格式、转交规则和禁止事项。
- `_skills/writing-association-trainer/evals/evals.json`：至少 8 个可重复压力场景，覆盖两篇联想练习、词义偷换、氛围收拢、信息不足、正史越界和正文转交。
- `_skills/writing-association-trainer/references/test-notes.md`：记录 RED 基线、GREEN 结果、人工评审标准、已知限制和迭代记录。

### 将修改

- `scripts/install-novel-skills.sh`：在保留现有 `novel-*` Skill 的前提下，显式发现并安装 `writing-association-trainer`；继续兼容 macOS Bash 3，不使用 `mapfile` 等 Bash 4 专属语法。
- `scripts/verify-novel-skills.sh`：把 `writing-association-trainer` 加入本地与已安装 Skill 的必检清单，并校验其 JSON。

### 不应修改

- 不修改任何具体小说目录。
- 不把 `文案文风/` 原笔记全文复制到 Skill；只提炼可迁移的方法和边界。
- 不改动 `novel-prose-craft-keeper` 的白描、视点或呼吸感规则。

## 模式边界

- **发散模式**：用户只给关键词或要求随机练习时使用；目标是扩大可用联想，不急着生成剧情。
- **收束模式**：用户已有一组联想，要求串成画面、情绪或故事胚芽时使用；目标是选出一条成立的桥接链。
- **点评模式**：用户提交自己的联想练习时使用；先指出具体词义、桥接强弱和情绪统一度，再给一项可执行改练，不替用户整篇重写。
- **正文转交模式**：用户要求章节、场景正文或写入项目时使用；停止继续扩写练习，确认目标小说和事实范围后转交正文 Skill。

## 评测判定维度

每个场景都按以下七项记录“通过 / 部分通过 / 失败”，不以文句华丽度代替行为验收：

1. 词义锚点：是否保留关键词的现实义项和可感知属性。
2. 发散广度：是否提供多种具体延伸，而不是只给一个同义词。
3. 桥接合法性：是否说明场景、动作、因果或人物处境的连接依据。
4. 氛围共存：多个物件是否能自然存在于同一场景，不依赖硬凑冲突或巧合。
5. 情绪收拢：是否选定一个主情绪，并让画面胚芽服务它。
6. 训练边界：是否把输出标为练习，不冒充小说正史或已确认剧情。
7. 分工转交：遇到正式正文请求时，是否停止越权扩写并转交正确 Skill。

## 实施任务

### Task 1: 建立 RED 压力场景并记录无 Skill 基线

**Files:**
- Create: `_skills/writing-association-trainer/evals/evals.json`
- Create: `_skills/writing-association-trainer/references/test-notes.md`

- [x] **Step 1: 写入第一版评测用例，不创建 SKILL.md**

使用以下场景作为第一版用例，`expected_output` 写成可人工判断的行为标准，而不是固定答案：

1. `树、安全带、考试`：分别发散，再找共同场景、动作链和统一情绪。
2. `给出“安全带→护身圈”`：指出这是从车内实物偷换成抽象概念，要求回到安全带的物理和情境功能。
3. `冰箱、手机壳、药片`：分别发散，再把三个物件放进同一个独居深夜场景，以孤独、遗憾、焦虑或治愈中的一个作为主情绪。
4. “让三个物件必须互相发生冲突”：拒绝无意义的剧情碰撞，说明它们可以通过共同氛围和人物状态自然共存。
5. 只给两个词或给出一组已有联想：补足缺口或点评现有联想，不擅自补出用户未给的题材和剧情。
6. 指定“压抑但克制”的情绪：所有桥接和故事胚芽都服务同一主情绪，不输出情绪互相打架的意象清单。
7. “把刚才的联想写进某小说正史”：明确练习草稿与正史的区别，要求定位项目并等待确认，不直接写文件或制造已确认事实。
8. “根据这三个词写一章正文”：说明联想训练已完成的部分，转交正文 Skill，并要求目标小说、章纲或场景事实。
9. “我已经有发散词表，帮我收拢”：验证 Skill 能直接进入收束模式，不重复无意义发散。
10. “点评我这段联想，不要替我改写”：验证点评模式能保留作者选择，只给问题定位和下一轮限制。
11. “用外在性格、内在性格、秘密、物品构建角色”：识别为人物塑造任务，转交未来的人物塑造 Skill，不把四维人物法冒充联想训练。

- [x] **Step 2: 运行无 Skill 基线**

对每个场景分别进行一次独立对话测试，记录模型是否出现以下失败：立即编剧情、只给炫技隐喻、偷换词义、没有统一情绪、把练习当正史、没有目标项目却直接写正文。

- [x] **Step 3: 将失败模式写入 `test-notes.md`**

按“输入 / 基线输出摘要 / 失败行为 / 需要 Skill 教会的规则”记录；不得把某次模型的偶然漂亮句子当作规范。

- [ ] **Step 4: 提交 RED 基线**（当前环境禁止写入 `.git/index.lock`，文件已保留在工作区）

```bash
git add _skills/writing-association-trainer/evals/evals.json _skills/writing-association-trainer/references/test-notes.md
git commit -m "test: add association trainer red baseline"
```

### Task 2: 编写最小可用 Skill

**Files:**
- Create: `_skills/writing-association-trainer/SKILL.md`

- [x] **Step 1: 写入严格触发描述**

Frontmatter 的 `description` 必须以 `Use when...` 开头，只描述触发场景，例如用户要求随机词联想、写作灵感发散、意象串联、故事胚芽训练或点评联想练习；不得在 description 中概括完整工作流。

- [x] **Step 2: 写入训练入口和输入检查**

规定先判断是随机词、用户给词、已有练习点评还是正文转交。关键词少于三个时不擅自补词，除非用户明确允许随机补足；缺少目标小说时不得进入正文写作。

- [x] **Step 3: 写入四段式核心流程**

主流程必须明确区分：

1. 发散：保留具体名词、动作、场景、感官、人物处境和情绪词。
2. 关联：标记桥接类型，并说明每个词如何通过同一场景、动作、因果或人物处境连接。
3. 防偷换：检查实物是否被无依据替换成抽象概念，指出断裂并给出物理可落地的修复方向。
4. 收拢：选择一个主情绪，压缩成最小场景胚芽、训练提示或短练习；默认不扩写成正式正文。

- [x] **Step 4: 写入固定输出契约**

默认输出顺序为：

```text
训练状态：练习草稿 / 需要补充输入 / 转交正文流程
关键词锚点：每词的具体义项与可延伸项
合法桥接：桥接类型、连接链、为什么成立
风险检查：偷换词义、空泛隐喻、情绪冲突、因果缺口
情绪收拢：主情绪、画面基调、最小故事胚芽
下一轮练习：一个可执行限制或替换词
```

- [x] **Step 5: 写入边界和转交规则**

明确：不写入小说文件、不升级设定、不生成未经确认的剧情事实；用户要求正文时，先标注练习结果，再转交 `novel-draft-writer` / `novel-prose-craft-keeper`，并要求目标项目和可用事实。

- [x] **Step 6: 做静态文档自检并提交 GREEN 实现**（提交动作受 `.git/index.lock` 写权限限制）

```bash
wc -l _skills/writing-association-trainer/SKILL.md
rg -n "正史|练习草稿|偷换|主情绪|桥接|正文|Use when" _skills/writing-association-trainer/SKILL.md
git diff --check
git add _skills/writing-association-trainer/SKILL.md
git commit -m "feat: add writing association trainer skill"
```

SKILL.md 应保持精炼；详细评分解释放入 `references/test-notes.md`，不把原笔记改写成冗长教材。

### Task 3: 运行 GREEN 评测并修补规则漏洞

**Files:**
- Modify: `_skills/writing-association-trainer/SKILL.md`
- Modify: `_skills/writing-association-trainer/evals/evals.json`
- Modify: `_skills/writing-association-trainer/references/test-notes.md`

- [x] **Step 1: 用 Skill 重跑全部压力场景**

重点观察是否同时满足“联想足够宽”和“收拢足够窄”：不能只列词，也不能未经桥接就编成完整剧情。

- [x] **Step 2: 逐项记录结果**

每个场景记录：是否保留词义锚点、是否解释桥接类型、是否统一主情绪、是否给出逻辑风险、是否守住正史边界、是否在正文请求时正确转交。

- [x] **Step 3: 针对新出现的合理化漏洞做最小修订**

例如模型用“象征意义”绕过具体词义检查，或把“最小故事胚芽”扩写成完整章节；修订应添加可执行判断句，不重复整套流程。

- [x] **Step 4: 追加至少一个非公路/考试场景**

加入一组不同题材的关键词，验证 Skill 学到的是联想方法，而不是复刻两组示例答案；另用人物四维请求确认不会误触发本 Skill。

- [ ] **Step 5: 提交评测结果**（提交动作受 `.git/index.lock` 写权限限制）

```bash
git add _skills/writing-association-trainer
git commit -m "test: verify association trainer behavior"
```

### Task 4: 接入安装与验证流程

**Files:**
- Modify: `scripts/install-novel-skills.sh`
- Modify: `scripts/verify-novel-skills.sh`

- [x] **Step 1: 扩展安装发现范围**

保留现有 `novel-*` 发现逻辑，并显式包含 `_skills/writing-association-trainer`；使用 Bash 3 兼容的数组读取方式，不引入 `mapfile`。

- [x] **Step 2: 扩展验证清单**

为 `writing-association-trainer` 检查 `SKILL.md`、`evals/evals.json`、`references/test-notes.md`，并对本地和临时安装目录的 JSON 运行 `python3 -m json.tool`。

- [x] **Step 3: 运行脚本语法检查**

```bash
bash -n scripts/install-novel-skills.sh
bash -n scripts/verify-novel-skills.sh
```

预期：两个命令均无输出并以 0 退出。

- [x] **Step 4: 在临时 CODEX_HOME 安装并验证**

```bash
review_home="$(mktemp -d /tmp/association-trainer-install.XXXXXX)"
CODEX_HOME="$review_home" bash scripts/install-novel-skills.sh
CODEX_HOME="$review_home" bash scripts/verify-novel-skills.sh
```

预期：安装输出包含 `writing-association-trainer`；验证输出包含该 Skill，且不修改用户真实的 `~/.codex/skills`。

- [ ] **Step 5: 提交安装接入**（提交动作受 `.git/index.lock` 写权限限制）

```bash
git add scripts/install-novel-skills.sh scripts/verify-novel-skills.sh
git commit -m "chore: install and verify association trainer"
```

### Task 5: 官方校验与最终验收

**Files:**
- Verify: `_skills/writing-association-trainer/SKILL.md`
- Verify: `_skills/writing-association-trainer/evals/evals.json`
- Verify: `scripts/install-novel-skills.sh`
- Verify: `scripts/verify-novel-skills.sh`

- [ ] **Step 1: 运行官方 Skill validator**（当前 Python 缺少 `yaml` 依赖）

使用当前环境可用的官方 validator 对 `SKILL.md` 运行 quick validation，预期输出 `Skill is valid!`。

- [x] **Step 2: 运行 JSON、Shell 和 diff 检查**

```bash
python3 -m json.tool _skills/writing-association-trainer/evals/evals.json >/dev/null
bash -n scripts/install-novel-skills.sh
bash -n scripts/verify-novel-skills.sh
git diff --check
```

- [x] **Step 3: 做一次独立人工复核**

复核以下问题：是否会把联想训练误触发为正文；是否会把练习结果写进项目；是否能解释“为什么成立”；是否会以抽象隐喻掩盖词义偷换；是否在不同题材下仍保持同一方法。

- [x] **Step 4: 更新 `test-notes.md` 的最终状态**

标明通过的场景、仍需人工判断的主观指标、已知限制和安装验证日期；不宣称 Skill 能复制原笔记作者的全部创造力，只记录它能稳定复刻的训练流程。

- [x] **Step 5: 生成最终交付摘要**

交付时说明：文件位置、是否已安装到全局 Skill、评测结果、未覆盖的小说文件，以及后续如需正式扩写应转交的 Skill。

## 计划自审清单

- [ ] 每个原始设计要求都有对应任务：发散、合法桥接、词义防偷换、情绪收拢、练习边界、正文转交。
- [ ] RED 阶段明确发生在创建 `SKILL.md` 之前。
- [ ] GREEN 阶段包含正常场景和越界场景，并记录人工可判断标准。
- [ ] 没有把具体小说设定写入共享 Skill。
- [ ] 没有把 `writing-association-trainer` 与 `novel-prose-craft-keeper` 合并。
- [ ] 安装脚本、验证脚本和 macOS Bash 兼容性都有明确步骤。
- [ ] 所有路径、命令和预期结果都已写明，没有 TBD、TODO 或“适当处理”等占位描述。

## 执行方式

计划完成后有两种执行方式：

1. **Subagent-Driven（推荐）**：按 Task 分派独立代理，每个任务完成后复核。
2. **Inline Execution**：在当前会话按 Task 批量执行，并在 RED、GREEN、最终验收处停下来检查。

Skill 实现已完成并通过行为、JSON、Shell 和临时安装验证；尚未安装到用户全局 Skill，也尚未提交 Git，原因分别是本轮未获全局安装授权，以及当前环境禁止写入 `.git/index.lock`。没有修改任何具体小说项目文件。
