---
name: novel-revision-desk
description: Use when the user wants to revise existing novel prose, 润色, 改稿, 审稿, line edit, polish, pacing repair, dialogue revision, 去AI味, scene tightening, or produce a revision draft for a named novel project.
---

# Novel Revision Desk

## Core Principle

Revise the words, protect the story. This skill improves existing prose while preserving confirmed facts, plot beats, timeline, character state, relationship state, and information boundaries unless the user explicitly asks for a larger story change.

Use this after `novel-workspace-router` has identified a single target novel project. Use it with `novel-style-keeper` for voice rules and with `novel-continuity-checker` when revisions might affect facts.

## What This Skill Handles

- Prose polish, line editing, and clarity repair.
- Scene tightening, pacing adjustment, transition repair, and tension shaping.
- Dialogue-only passes and character voice separation.
- Audit-only reports that identify revision targets without rewriting.
- Revision drafts for existing chapter or scene files.
- 去 AI 味 when the task is phrasing, rhythm, specificity, or over-explanation.

Do not use this skill to:

- Create a new novel project.
- Draft a new chapter from an outline.
- Build or change the world bible, character bible, timeline, or outline.
- Perform a full continuity audit across multiple chapters.
- Export a manuscript package.
- Precisely imitate a living author's style.

## Required Target And Source

A named novel project and source text are required.

If the project is missing, ask:

```text
要修订哪一本小说？
```

If the source text or file is missing, ask:

```text
要修订哪一章、哪一段，或哪一个文件？
```

Do not revise project-specific prose in the workspace root, `_agent/`, `_skills/`, `_templates/`, or `_research/`.

## Read Before Revising

Read the smallest relevant set:

1. Target chapter or scene under `04_正文草稿/`, or the source text provided by the user.
2. `00_项目总纲/项目说明.md`
3. `00_项目总纲/读者体验.md` when available
4. `00_项目总纲/禁止事项.md` when available
5. `05_修订与审校/风格修订.md` when available
6. `06_状态快照/当前上下文.md` when scene placement matters
7. `06_状态快照/事实快照.md` and `已确认设定.md` when facts might be touched
8. `06_状态快照/角色状态快照.md` when character state, injuries, knowledge, or relationships matter
9. Relevant character files under `02_角色资料库/` when dialogue or character voice is involved
10. `05_修订与审校/问题清单.md` or `审校记录.md` when revising known issues

Read only what is necessary for the requested revision. If the user provides a short passage directly, project files may be optional unless the user asks for project-specific consistency.

## Revision Modes

Classify the request before editing:

| Mode | Use for | Output |
| --- | --- | --- |
| Audit only | "只检查", "给修改意见", "哪里有问题" | Findings and prioritized actions, no rewrite |
| Line polish | wording, rhythm, clarity, sentence flow | Revised passage plus change report |
| Scene tightening | pacing, tension, transitions, redundancy | Revised scene plus preserved beats |
| Dialogue pass | voice separation, subtext, tags, information flow | Dialogue-focused revision |
| Style repair | 去 AI 味, house style, banned phrases | Revision guided by project style notes |
| Separate revision draft | user asks to save or produce a revised version | New draft file or clearly marked revised section |

If the request changes plot outcome, character fate, canon rules, chapter structure, timeline, or future consequences, stop and route the story change before revising prose.

## Preservation Rules

Unless the user explicitly requests a story change and confirms the consequence path, preserve:

- Who is present in the scene.
- Location, time, sequence of events, and scene outcome.
- Character injuries, resources, secrets, knowledge, emotions, and relationship state.
- World rules, abilities, technology, institutions, and constraints.
- Object ownership, availability, and evidence.
- Foreshadowing status and unresolved hooks.
- Point of view and information boundaries.

If a better sentence would alter a fact, do not make the change silently. Flag it under `事实风险`.

## Living Author Style Safety

Do not precisely imitate a living author or produce text labeled as that author's exact style. Offer a high-level alternative:

```text
我不能精确模仿这位作者，但可以按非专属的高层目标来修，比如叙述距离、句式节奏、意象密度、对白含蓄程度和情绪温度。
```

Use the project's own style rules and the user's own samples when available.

## Output Contracts

### Audit Only

```markdown
目标项目：
检查范围：
依据文件：

总体判断：
优先级问题：
- P1：
- P2：
- P3：

结构与节奏：
对白与人物声音：
信息释放：
文风与去 AI 味：
事实风险：
建议下一步：
```

### Revision Draft

```markdown
目标项目：
修订范围：
修订模式：
依据文件：

修订稿：

保留不变：
改动说明：
事实风险：
需要用户确认：
建议写入：
```

### Dialogue Pass

```markdown
目标项目：
对白范围：
角色声音依据：

修订对白：

声音区分：
信息边界：
保留不变：
```

## Saving Revisions

Save revision output only when the user explicitly asks to write it to disk.

Before writing:

1. Resolve the named project folder.
2. Identify the exact target path.
3. Check whether the target file exists.
4. Prefer a separate file such as `第001章_修订稿.md` or a clearly named revision section.
5. If the user asks to overwrite, inspect the existing file and ask for explicit confirmation naming the exact path and replacement scope.
6. Do not update bible, outline, timeline, or snapshots in the same pass unless the user confirms a separate consequence update.

## Relationship With Other Novel Skills

- Use `novel-workspace-router` when the target project is unclear.
- Use `novel-draft-writer` when the user wants a new chapter or scene from an outline rather than revision of existing prose.
- Use `novel-style-keeper` when the task is extracting, defining, or preserving style rules.
- Use `novel-continuity-checker` when a revision may affect facts across chapters.
- Use `novel-plot-architect` when the requested change alters plot structure, chapter outcome, conflict chain, timeline design, or foreshadowing plan.
- Use `novel-bible-manager` when the requested change modifies setting, character records, factions, places, or terms.

## Stop And Ask First

Stop before revising when:

- The target novel project is missing.
- The source text or file is missing.
- The user asks to overwrite an existing file without an explicit path-level confirmation.
- The request would change canon, plot outcome, character fate, timeline, or future continuity.
- The request asks for exact imitation of a living author.
- The requested scope is too broad to preserve facts safely without source files.

Ask the single most important question needed to proceed.

## Common Cases

Polish without changing facts:

```text
我会只动表达、节奏、转场和情绪呈现，不改人物行动、时间地点、信息差和结果。修订后会列出“保留不变”和“事实风险”。
```

Audit only:

```text
我先只出问题清单和优先级，不直接重写。
```

Plot-changing revision:

```text
这不是单纯润色，会改变剧情结果和后续连续性。我先不把它写进修订稿，建议先用剧情结构和连续性检查确认影响。
```

Overwrite request:

```text
覆盖会替换原稿。我需要先确认准确路径和替换范围，并建议保留一份修订稿或备份。
```
