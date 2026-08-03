# White Description Skill Enhancement Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Enhance `novel-prose-craft-keeper` so it deliberately recognizes, explains, applies, and safely limits white-description techniques in novel drafting and revision.

**Architecture:** Keep `novel-prose-craft-keeper` as the single prose-technique controller. Put the concise definition, value, trigger routing, and safeguards in `SKILL.md`; put detailed space, viewpoint, action, and breathing methods in four conditional reference files. Extend the existing rubric and evals so the skill is tested for both effective use and over-application.

**Tech Stack:** Markdown skill instructions, JSON eval cases, Codex skill validator, shell-based workspace checks, subagent scenario tests.

---

## Scope boundary

This plan implements only the white-description enhancement. `writing-association-trainer` will receive a separate plan after this skill passes its own RED-GREEN-REFACTOR cycle, because skills must not be created in an unverified batch.

Original notes under `文案文风/` remain unchanged. Existing user modifications elsewhere in the repository remain untouched.

## File map

**Modify:**

- `_skills/novel-prose-craft-keeper/SKILL.md` — add definition, value, symptom routing, conditional reference loading, and anti-overcorrection rules.
- `_skills/novel-prose-craft-keeper/references/prose-craft-rubric.md` — add explicit white-description and over-application checks.
- `_skills/novel-prose-craft-keeper/evals/evals.json` — add application and counterexample cases.
- `_skills/novel-prose-craft-keeper/references/test-notes.md` — record baseline failures, post-change results, and review criteria.

**Create:**

- `_skills/novel-prose-craft-keeper/references/white-description-space.md` — character-object-space anchoring.
- `_skills/novel-prose-craft-keeper/references/white-description-viewpoint.md` — viewpoint boundaries and transitions.
- `_skills/novel-prose-craft-keeper/references/white-description-action.md` — exposition diagnosis and action continuity.
- `_skills/novel-prose-craft-keeper/references/white-description-breathing.md` — information focus, sentence rhythm, paragraph pauses, and emotional restraint.

## Task 1: Establish the failing baseline

**Files:**

- Read: `_skills/novel-prose-craft-keeper/SKILL.md`
- Read: `_skills/novel-prose-craft-keeper/evals/evals.json`
- Modify after testing: `_skills/novel-prose-craft-keeper/references/test-notes.md`

- [ ] **Step 1: Prepare three baseline scenarios without loading the proposed white-description references**

Use these exact prompts:

```text
场景A：把这段小说改得更有画面感，但不要新增剧情事实：
“陈默回到办公室，非常疲惫，也很担心明天的审查。他坐下来考虑了很久，最终决定隐瞒文件丢失的事。”
说明你改动的依据。
```

```text
场景B：修订这段视角混乱且信息拥挤的文字，保持第三人称有限视角：
“林秋推门进屋，她没发现身后的保安已经认出了她。走廊的灯、雨声、消毒水味和墙上的裂缝同时让她紧张。保安心想她肯定就是嫌疑人，林秋觉得所有人都在盯着自己。”
```

```text
场景C：用户要求‘严格白描，摄像机拍不到的一律删除’，原文中有一段决定人物选择的内心判断。请修订并解释是否全部删除心理内容。
```

- [ ] **Step 2: Run independent baseline agents**

Run the three prompts in fresh subagents without exposing the new design or expected answer. Save raw outputs outside the repository or keep them in the agent transcript.

Expected RED evidence: at least one response should omit a clear spatial action chain, leave viewpoint leakage unresolved, treat breathing as line splitting, or accept the instruction to delete all interiority without explaining the cost. If all scenarios already pass, tighten the prompts until a real missing behavior is observed before editing the skill.

- [ ] **Step 3: Record exact baseline failures**

Append a dated section to `references/test-notes.md` containing:

```markdown
## 2026-08-03 白描增强失败基线

### 场景A
- 原始表现：
- 缺失能力：

### 场景B
- 原始表现：
- 缺失能力：

### 场景C
- 原始表现：
- 过度执行风险：
```

- [ ] **Step 4: Commit the RED evidence**

```bash
git add _skills/novel-prose-craft-keeper/references/test-notes.md
git commit -m "test: record white-description skill baseline"
```

## Task 2: Add the four white-description reference modules

**Files:**

- Create: `_skills/novel-prose-craft-keeper/references/white-description-space.md`
- Create: `_skills/novel-prose-craft-keeper/references/white-description-viewpoint.md`
- Create: `_skills/novel-prose-craft-keeper/references/white-description-action.md`
- Create: `_skills/novel-prose-craft-keeper/references/white-description-breathing.md`

- [ ] **Step 1: Write the space module**

Include these exact sections:

```markdown
# 白描：人物与空间

## 适用症状
## 创作价值
## 三层空间锚定
## 动作—物件—后果链
## 短例：悬浮人物与落地场景
## 不要机械添加环境
## 检查问题
```

Require every chosen detail to constrain action, reveal character, carry emotion, or prepare a later change. Reject decorative inventories.

- [ ] **Step 2: Write the viewpoint module**

Include these exact sections:

```markdown
# 白描：视点控制

## 适用症状
## 创作价值
## 当前观察者的信息边界
## 第一人称、第三人称有限与全知
## 安全切换信号
## 短例：无信号越界与有限视点修订
## 小说不是摄像机
## 检查问题
```

Explicitly allow mirrors, remembered information, inference, interiority, and authorial narration when the viewpoint can legitimately access them. Define a viewpoint violation as unmarked access to another consciousness, not merely writing something a camera cannot film.

- [ ] **Step 3: Write the action module**

Include these exact sections:

```markdown
# 白描：动作连续与叙事提纯

## 适用症状
## 创作价值
## 区分场景呈现与必要概述
## 静态信息转化为动作变化
## 局部判断代替万能作者结论
## 短例：说明书与行动链
## 不应删除的叙述内容
## 检查问题
```

Use the sequence `目标 → 动作 → 阻力 → 调整 → 后果` as a diagnostic, not as a mandatory visible template.

- [ ] **Step 4: Write the breathing module**

Include these exact sections:

```markdown
# 白描：文字呼吸

## 适用症状
## 创作价值
## 一个注意力中心
## 句长服从动作和压力
## 段落停顿与情绪留白
## 短例：拥挤版本与自然版本
## 呼吸不等于碎句
## 检查问题
```

Forbid fixed sentence-length recipes and repeated single-sentence paragraphs. Preserve continuous syntax when perception or action is continuous.

- [ ] **Step 5: Review references against source notes**

Compare the four files with the five relevant articles under `文案文风/`. Confirm that every source idea is either retained, corrected, or explicitly rejected as an overgeneralization. Do not copy full articles.

- [ ] **Step 6: Commit the reference modules**

```bash
git add _skills/novel-prose-craft-keeper/references/white-description-*.md
git commit -m "feat: add white-description craft references"
```

## Task 3: Route and explain white description in the main skill

**Files:**

- Modify: `_skills/novel-prose-craft-keeper/SKILL.md`

- [ ] **Step 1: Expand triggering keywords**

Update the frontmatter description to include `白描`, `人物悬浮`, `视角漂移`, `作者解说过多`, and `静态照片感`, while retaining existing prose, breathing, documentary, and AI-feel triggers. The description must remain a trigger list rather than a workflow summary.

- [ ] **Step 2: Add the definition and value block**

After `核心职责`, add a compact section that defines white description as action, object state, spatial relationship, and bounded perception. State its novel-writing value as spatial grounding, viewpoint trust, action continuity, emotional co-creation, narrative economy, rhythm, and character revelation.

- [ ] **Step 3: Add symptom-based conditional loading**

Add a routing table:

| Symptom | Required reference |
|---|---|
| 人物悬浮、空间不清 | `white-description-space.md` |
| 视角漂移、越过感知边界 | `white-description-viewpoint.md` |
| 说明书、静态照片、作者代替人物下结论 | `white-description-action.md` |
| 信息拥挤、机械碎句、情绪说满 | `white-description-breathing.md` |

Require loading only relevant modules, or all four for a comprehensive white-description audit.

- [ ] **Step 4: Add anti-overcorrection safeguards**

State explicitly:

- White description is a scene technique, not the only valid prose mode.
- “Camera can film it” is a redundancy test, not a ban on interiority.
- Environment details must work, not accumulate.
- Stable viewpoint does not forbid signaled viewpoint changes.
- Breathing does not mean splitting every sentence or paragraph.
- Necessary summary, transition, memory, reflection, and free indirect discourse may remain.

- [ ] **Step 5: Check word count and internal consistency**

Run:

```bash
wc -l _skills/novel-prose-craft-keeper/SKILL.md
rg -n "白描|white-description|摄像机|心理|自由间接|碎句" _skills/novel-prose-craft-keeper/SKILL.md
```

Expected: `SKILL.md` stays below 500 lines; all four references are named exactly once in the routing area; safeguards do not conflict with the existing documentary-camera rules.

- [ ] **Step 6: Commit main skill routing**

```bash
git add _skills/novel-prose-craft-keeper/SKILL.md
git commit -m "feat: route white-description prose guidance"
```

## Task 4: Extend rubric and eval coverage

**Files:**

- Modify: `_skills/novel-prose-craft-keeper/references/prose-craft-rubric.md`
- Modify: `_skills/novel-prose-craft-keeper/evals/evals.json`
- Modify: `_skills/novel-prose-craft-keeper/references/test-notes.md`

- [ ] **Step 1: Add rubric checks**

Add checks for:

- character-object-space legibility;
- viewpoint access and transition signals;
- action state changes rather than decorative detail;
- balance between scene and necessary summary;
- sentence/paragraph rhythm following attention;
- preservation of useful interiority and narrative compression.

- [ ] **Step 2: Add eval cases**

Add five JSON evals covering:

1. floating character to grounded scene;
2. viewpoint leakage repair;
3. explanatory summary to action chain;
4. dense prose to natural breathing without information loss;
5. rejection of the request to delete all camera-invisible material.

Each expected output must name both desired behavior and forbidden overcorrection. Keep valid JSON and do not renumber existing IDs.

- [ ] **Step 3: Verify RED tests still describe real gaps**

Compare the new eval expectations with the recorded baseline. Ensure the new rules address observed failures rather than unrelated hypothetical style preferences.

- [ ] **Step 4: Validate files**

Run:

```bash
python3 -m json.tool _skills/novel-prose-craft-keeper/evals/evals.json >/dev/null
python3 /Users/yao/.codex/skills/.system/skill-creator/scripts/quick_validate.py _skills/novel-prose-craft-keeper
git diff --check -- _skills/novel-prose-craft-keeper
```

Expected: JSON parser exits 0; validator reports a valid skill; diff check emits no whitespace errors.

- [ ] **Step 5: Commit rubric and evals**

```bash
git add _skills/novel-prose-craft-keeper/references/prose-craft-rubric.md _skills/novel-prose-craft-keeper/evals/evals.json _skills/novel-prose-craft-keeper/references/test-notes.md
git commit -m "test: cover white-description craft behavior"
```

## Task 5: Run GREEN tests and refactor

**Files:**

- Read: all modified skill files
- Modify if needed: only `_skills/novel-prose-craft-keeper/`

- [ ] **Step 1: Re-run the three baseline scenarios with the enhanced skill**

Use fresh subagents. Tell each agent to use `_skills/novel-prose-craft-keeper/SKILL.md` and load only the relevant new reference files. Do not include expected answers or baseline diagnoses in their prompts.

- [ ] **Step 2: Review GREEN outputs**

Require all of the following:

- Scene A establishes a concrete spatial/action chain and reveals worry through behavior without inventing plot facts.
- Scene B removes unmarked access to the guard's mind, chooses a clear attention center, and avoids merely splitting the original into shorter lines.
- Scene C refuses the absolute camera rule and preserves interiority that determines choice.
- Explanations identify when and why white description adds value.
- None of the outputs turn into shot lists or use production terminology inside prose.

- [ ] **Step 3: Refactor only observed weaknesses**

If a GREEN output fails, update the smallest relevant reference or routing sentence. Record the failure and correction in `references/test-notes.md`, then rerun only that scenario with a fresh subagent.

- [ ] **Step 4: Run final local verification**

Run:

```bash
python3 -m json.tool _skills/novel-prose-craft-keeper/evals/evals.json >/dev/null
python3 /Users/yao/.codex/skills/.system/skill-creator/scripts/quick_validate.py _skills/novel-prose-craft-keeper
git diff --check -- _skills/novel-prose-craft-keeper
```

Expected: every command exits 0 and test notes document RED and GREEN evidence.

- [ ] **Step 5: Commit final refactor if needed**

```bash
git add _skills/novel-prose-craft-keeper
git commit -m "refactor: tighten white-description safeguards"
```

## Task 6: Prepare installation handoff

**Files:**

- Read: `scripts/install-novel-skills.sh`
- Read: `scripts/verify-novel-skills.sh`

- [ ] **Step 1: Confirm source skill is complete**

Run:

```bash
git status --short -- _skills/novel-prose-craft-keeper
rg --files _skills/novel-prose-craft-keeper | sort
```

Expected: all intended files are committed; no unrelated repository changes are staged.

- [ ] **Step 2: Request installation approval separately**

Installation writes to `~/.codex/skills` and creates a backup. Do not run it implicitly. Report the verified source-skill result and ask whether to install the updated skill locally.

- [ ] **Step 3: Start a separate plan for `writing-association-trainer`**

Only after this skill is verified, create the second implementation plan and repeat RED-GREEN-REFACTOR independently.
