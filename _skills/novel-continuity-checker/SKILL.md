---
name: novel-continuity-checker
description: Use when the user wants to check novel continuity, consistency, 连贯性, 设定冲突, 时间线错误, 角色状态漂移, 信息差, 伏笔遗漏, 物品状态, 人物关系变化, or audit chapters against a named novel project's bible and snapshots.
---

# Novel Continuity Checker

## Core Principle

Find the break before fixing the prose. This skill audits chapters, outlines, and snapshots for continuity errors, then reports issues and repair options. It does not silently rewrite chapters or overwrite canon.

Use this after `novel-workspace-router` has identified a single target novel project. Use it after `novel-bible-manager` and `novel-plot-architect` when the relevant bible or outline context needs to exist first.

## When to Use

Use when the user asks to:

- Check 连贯性, 一致性, 设定冲突, or timeline problems.
- Audit a chapter against confirmed settings, facts, character states, and outlines.
- Find character state drift, knowledge errors, location errors, object continuity, power-rule violations, relationship jumps, or forgotten foreshadowing.
- Produce a revision issue list before rewriting.

Do not use for:

- Creating new worldbuilding or canon.
- Writing a new chapter from an outline.
- Designing plot structure from scratch.
- Pure language polishing with no continuity concern.
- Exporting manuscripts.

## Required Target

A target novel project is required.

If the user does not name a novel project and the current directory is not clearly inside one, stop and ask:

```text
要检查哪一本小说的连续性？
```

Do not check or write project-specific continuity notes into the workspace root, `_agent/`, `_skills/`, `_templates/`, or `_research/`.

## Read Before Checking

Read the smallest relevant set:

1. `00_项目总纲/项目说明.md`
2. `06_状态快照/当前上下文.md`
3. `06_状态快照/已确认设定.md`
4. `06_状态快照/事实快照.md`
5. `06_状态快照/角色状态快照.md`
6. `06_状态快照/未解决伏笔.md`
7. Relevant files under `01_设定资料库/`
8. Relevant files under `02_角色资料库/`
9. Relevant files under `03_剧情结构/`
10. The target chapter, scene, outline, or draft being checked

If a relevant file is missing, mention the gap and downgrade certainty instead of inventing facts.

## Check Categories

Use these categories when auditing:

| Category | What to look for |
| --- | --- |
| Canon conflict | Text contradicts `已确认设定.md`, rules, locations, terms, or accepted facts |
| Timeline | Time of day, elapsed time, event order, travel time, sequence conflicts |
| Character state | Injuries, fatigue, mood, location, ability, possessions, disguise, status |
| Knowledge / information gap | A character knows something they never learned, or forgets something they should know |
| Object continuity | Items appear, vanish, change owner, break, or work without setup |
| Rule / ability limits | Abilities, systems, laws, costs, cooldowns, or constraints are violated |
| Relationship drift | Trust, hostility, kinship, hierarchy, or intimacy changes without cause |
| Foreshadowing | Setup forgotten, payoff premature, payoff missing, or clue too explicit |
| Causality | Event lacks trigger, reaction exceeds cause, consequence disappears |
| Terminology | Names, titles, place names, dates, and terms become inconsistent |

## Severity Levels

Use this severity scale:

| Severity | Meaning |
| --- | --- |
| Critical | Breaks confirmed canon, completed prose, major timeline, or core character logic |
| Major | Confuses reader, damages cause-effect, or requires scene-level repair |
| Minor | Local inconsistency, wording mismatch, or easy patch |
| Note | Observation, uncertainty, or optional improvement |

## Output Format

Start with:

```text
目标项目：
检查范围：
读取依据：
总体判断：
```

Then report issues:

```text
一、严重问题
- 严重级别：
- 位置：
- 问题：
- 依据：
- 修复建议：

二、一般问题

三、待确认问题

四、可选优化
```

End with:

```text
建议写入：
需要用户确认：
下一步：
```

If no issues are found, say what was checked and what risk remains because of missing files or incomplete context.

## Writing Rules

By default, write only review records, not prose changes.

Allowed without extra confirmation when the user requested a check:

- Append a summary to `05_修订与审校/连贯性检查.md`.
- Append issue references to `05_修订与审校/问题清单.md`.

Require confirmation before:

- Editing completed chapters.
- Updating `已确认设定.md`.
- Updating `事实快照.md`.
- Updating `角色状态快照.md`.
- Changing timeline, foreshadowing, outline, character fate, or core rules.
- Deleting or replacing existing review records.

If the user asks to "直接改", still identify the issues first. Then ask for confirmation before changes that affect canon, snapshots, or completed prose.

## Check Procedure

1. State the target project and check scope.
2. Read required context.
3. Compare the target text or outline against confirmed settings, facts, snapshots, and plot structure.
4. Classify each issue by category and severity.
5. Separate certain issues from uncertain issues caused by missing context.
6. Propose repair options.
7. Record the check only if safe and requested.
8. Ask for confirmation before any rewrite or canon update.

## Stop And Ask First

Stop before checking or writing when:

- Target novel project is missing.
- The user asks to check multiple novels at once without saying whether this is comparative work.
- The target chapter or scene is not identifiable.
- The user asks to overwrite completed prose or snapshots before seeing the issue list.
- Required context is missing and the check would require inventing facts.

Ask only the single most important question needed to proceed.

## Common Cases

### Character Injury Conflict

Input: `已确认主角左臂受伤不能抬手，但第三章写他左手举枪。`

Expected behavior:

- Flag as Critical or Major character state conflict.
- Cite the confirmed state and the conflicting action.
- Suggest repair: change action hand, adjust injury state with confirmation, or add recovery setup.
- Do not update snapshots silently.

### Time Jump Problem

Input: `第二章是夜里，第三章同一时刻天已经大亮。`

Expected behavior:

- Flag timeline conflict.
- Suggest adding elapsed time, changing lighting, or splitting scenes.

### Information Gap

Input: `主角没见过沈砚，却知道沈砚秘密身份。`

Expected behavior:

- Flag knowledge/information gap.
- Suggest bridge scene, clue, overheard line, or changing the claim.

### Direct Rewrite Request

Input: `直接把第五章不连贯的地方改掉，并同步更新已确认设定。`

Expected behavior:

- Produce issue list first.
- Ask for confirmation before editing chapter or updating canon.

## Common Mistakes

| Mistake | Correct behavior |
| --- | --- |
| Rewriting prose before reporting issues | Report first |
| Treating missing context as permission to invent | Mark uncertainty |
| Updating canon to fit a chapter mistake | Ask first |
| Mixing style feedback with continuity severity | Separate categories |
| Ignoring character knowledge limits | Check what each character can know |
| Treating foreshadowing plans as written facts | Verify whether setup/payoff exists |

## Relationship to Other Skills

- Use `novel-workspace-router` first when the target or task type is unclear.
- Use `novel-bible-manager` when canon needs organization or confirmation.
- Use `novel-plot-architect` when the problem is structural outline design.
- Use `novel-style-keeper` when the issue is voice or style rather than continuity.
- Use `novel-revision-desk` after the user approves repairs and wants revised prose.
