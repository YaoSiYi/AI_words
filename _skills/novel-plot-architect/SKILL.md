---
name: novel-plot-architect
description: Use when the user wants to build, revise, or check novel plot structure, 全书大纲, 卷纲, 章纲, 主线, 支线, 冲突链, 伏笔, 时间线, 剧情因果, chapter outline, volume outline, or story architecture for a named novel project.
---

# Novel Plot Architect

## Core Principle

Structure before prose. This skill designs and maintains plot architecture: outlines, conflicts, causality, foreshadowing, and timeline. It does not write finished scenes or chapters.

Use this after `novel-workspace-router` has identified a single target novel project and after `novel-bible-manager` has organized the relevant setting material when needed.

## When to Use

Use when the user asks to:

- Create or revise 全书大纲, 卷纲, or 章纲.
- Organize main plot, subplot, conflict chain, foreshadowing, or timeline.
- Check whether plot beats have clear cause and effect.
- Turn confirmed bible material into a structured plot plan.
- Break a story direction into stages, volumes, chapters, or scenes.

Do not use for:

- Writing full prose, scenes, dialogue, or publishable chapters.
- Creating or changing canon worldbuilding without `novel-bible-manager`.
- Continuity checking completed prose in detail.
- Exporting manuscripts.
- Web or market research.

## Required Target

A target novel project is required.

If the user does not name a novel project and the current directory is not clearly inside one, stop and ask:

```text
要为哪一本小说设计剧情结构？
```

Do not write plot files into the workspace root, `_agent/`, `_skills/`, `_templates/`, or `_research/`.

## Read Before Writing

Read the smallest relevant set:

1. `00_项目总纲/项目说明.md`
2. `00_项目总纲/创作目标.md` when available
3. `06_状态快照/当前上下文.md`
4. `06_状态快照/已确认设定.md`
5. `06_状态快照/事实快照.md`
6. `02_角色资料库/角色总表.md` and relevant role files
7. Existing files under `03_剧情结构/`

For plot work that depends on uncertain setting or character material, read relevant files under `01_设定资料库/` and `02_角色资料库/`.

## Plot Material Classes

Classify plot material before writing:

| Class | Meaning | Write behavior |
| --- | --- | --- |
| Confirmed plot | User explicitly approves or existing outline already establishes it | May write to outline files |
| Draft plot | Proposed structure not yet approved | Mark as 草案 or 待确认 |
| Written fact | Already appears in prose or fact snapshot | Treat as fixed unless user confirms change |
| Foreshadowing plan | Planned setup and payoff | Write to `伏笔表.md`, not as current fact |
| Timeline event | Sequence or chronology | Write to `时间线.md` if confirmed or label as planned |
| Conflict | Core pressure between goals, values, factions, or events | Write to `冲突链.md` |
| Contradiction | Conflicts with confirmed setting, written prose, or approved outline | Stop and ask |

When unsure whether a plot point is approved, mark it as draft.

## File Placement Map

| Material | Primary destination |
| --- | --- |
| Whole-book premise and phase structure | `03_剧情结构/全书大纲.md` |
| Volume-level arc | `03_剧情结构/卷纲/第NN卷.md` |
| Chapter-level plan | `03_剧情结构/章纲/第NNN章.md` |
| Cause-and-effect pressure | `03_剧情结构/冲突链.md` |
| Setup and payoff | `03_剧情结构/伏笔表.md` |
| Chronological order | `03_剧情结构/时间线.md` |
| Current plot position | `06_状态快照/当前上下文.md` |
| Written plot facts | `06_状态快照/事实快照.md` only after confirmed or written |

Do not duplicate full outlines into snapshots. Snapshots should only summarize current position and durable facts.

## Output Structures

### Full-Book Outline

Use this shape when creating or revising `全书大纲.md`:

```text
一句话核心：
主线：
支线：
阶段结构：
关键转折：
核心冲突：
主要伏笔：
待确认问题：
```

### Volume Outline

Use this shape for a volume file:

```text
本卷目标：
本卷起点：
本卷终点：
核心冲突：
主要角色变化：
关键章节节点：
伏笔埋设：
伏笔回收：
待确认问题：
```

### Chapter Outline

Use this shape for a chapter file:

```text
本章目标：
出场角色：
场景地点：
前置状态：
冲突推进：
新增信息：
状态变化：
结尾钩子：
影响的伏笔 / 时间线：
待确认问题：
```

## Update Procedure

1. State the target project.
2. Read required context.
3. Determine whether the user wants full-book, volume, chapter, conflict, foreshadowing, or timeline work.
4. Classify proposed material as confirmed, draft, written fact, foreshadowing plan, timeline event, conflict, or contradiction.
5. Detect conflicts against confirmed settings, written facts, and approved outline.
6. If conflicts exist, stop and ask for confirmation before writing.
7. If safe, write or propose the relevant structure.
8. Mark unconfirmed assumptions explicitly.
9. End with a plot update report.

## Plot Update Report

After work, report:

```text
目标项目：
处理范围：
已写入：
草案 / 待确认：
影响的伏笔：
影响的时间线：
发现的冲突：
需要用户确认：
下一步建议：
```

If no files were changed, say why.

## Stop And Ask First

Stop before writing when:

- Target novel project is missing.
- The user asks for full prose rather than outline.
- The requested plot contradicts confirmed canon, completed prose, or approved ending.
- The user asks to overwrite large outline files without specifying whether to replace or revise.
- The plot depends on missing core setting or character facts.
- The task belongs to multiple novels.

Ask only the single most important question needed to proceed.

## Common Cases

### Chapter Outline Only

Input: `给《旧城月》做前三章章纲，不写正文。`

Expected behavior:

- Read confirmed context.
- Create or propose `第001章.md` to `第003章.md`.
- Include goals, conflict, new information, state changes, and hooks.
- Do not write prose paragraphs.

### Foreshadowing Table

Input: `第一章出现黑桥，第三章回收。`

Expected behavior:

- Write or propose a `伏笔表.md` entry.
- Treat it as a setup/payoff plan, not as already written fact unless the text exists.

### Conflict With Approved Ending

Input: `已确认主角最后离开南亭，现在改成主角留下接管城市。`

Expected behavior:

- Detect contradiction.
- Ask whether to update the approved ending before changing outline files.

### Prose Request

Input: `帮我写第一章完整正文，顺便定章纲。`

Expected behavior:

- Offer to create the chapter outline first.
- Hand prose writing to `novel-draft-writer`.
- Do not write full prose under this skill.

## Common Mistakes

| Mistake | Correct behavior |
| --- | --- |
| Turning chapter outline into prose | Keep output structural |
| Treating a foreshadowing plan as fact | Keep it in `伏笔表.md` until written |
| Ignoring approved ending conflicts | Stop and ask |
| Creating plot from missing canon | Mark assumptions or ask |
| Updating snapshots with draft beats | Snapshots store current facts only |
| Mixing outline and market advice | Keep this skill focused on structure |

## Relationship to Other Skills

- Use `novel-workspace-router` first when the task type or target is unclear.
- Use `novel-bible-manager` when setting, rules, roles, places, or terms need organization first.
- Use `novel-continuity-checker` to audit completed prose or cross-file consistency.
- Use `novel-draft-writer` for full prose after chapter outline is approved.
- Use `novel-revision-desk` for revising prose, not structural planning.

