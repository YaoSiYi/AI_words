---
name: novel-bible-manager
description: Use when the user wants to organize, classify, update, or check a novel bible, 世界观, 设定, 角色资料, 势力, 地点, 历史, 术语表, 已确认设定, 待确认设定, 灵感草稿, or novel notes for a named novel project.
---

# Novel Bible Manager

## Core Principle

Separate canon from possibility. This skill keeps a novel's bible useful by classifying material before writing it: confirmed setting, written fact, pending idea, inspiration, external reference, or conflict.

Use this after `novel-workspace-router` has identified a single target novel project, or after `novel-project-initializer` has created one.

## When to Use

Use when the user asks to:

- 整理世界观、设定、规则、角色、势力、地点、历史或术语。
- Turn scattered notes into a maintainable novel bible.
- Update confirmed settings or state snapshots.
- Check whether a new setting conflicts with existing canon.
- Classify raw ideas as confirmed, pending, or inspiration.

Do not use for:

- Writing chapters, scenes, dialogue, or prose.
- Designing full plots, 卷纲, 章纲, 伏笔链, or endings.
- Exporting files.
- Searching the web unless paired with `novel-research-scout`.

## Required Target

A target novel project is required.

If the user does not name a novel project and the current directory is not clearly inside one, stop and ask one question:

```text
要把这些资料整理到哪一本小说项目？
```

Do not write bible content into the workspace root, `_agent/`, `_skills/`, `_templates/`, or `_research/` unless the user explicitly asks for workspace-level reference notes.

## Read Before Writing

For a single-novel task, read the smallest relevant set:

1. `00_项目总纲/项目说明.md`
2. `06_状态快照/当前上下文.md`
3. `06_状态快照/已确认设定.md`
4. `06_状态快照/事实快照.md`
5. Relevant files under:
   - `01_设定资料库/`
   - `02_角色资料库/`
   - `03_剧情结构/` when timeline or foreshadowing is affected

If a file is missing, create an empty template only when it is part of the standard project structure and doing so will not overwrite user content.

## Classification Rules

Classify every input before writing it.

| Class | Signals | Write behavior |
| --- | --- | --- |
| Confirmed setting | 用户说已确认, 就是, 正式设定, 采纳为设定 | May enter relevant bible file and `已确认设定.md` |
| Written fact | Already appears in completed prose or fact snapshot | Preserve as fact; do not contradict without confirmation |
| Pending setting | 可能, 也许, 暂定, 待定, 还没想好, 二选一 | Write under 待确认设定, not confirmed canon |
| Inspiration draft | 灵感, 先记一下, 可以考虑, 参考一下 | Write under 灵感草稿 or reference notes |
| External reference | 网上资料, GitHub, 现实资料, 扫榜, 拆文 | Write to `07_参考资料/` unless explicitly adopted |
| Conflict | Contradicts confirmed setting, written prose, or fact snapshot | Stop and ask whether to update canon |

When unsure, choose the safer lower-status class: pending or inspiration.

## Canon Priority

Use this priority order when sources disagree:

```text
User's current explicit instruction
  > 已确认设定
  > 已写正文
  > 事实快照
  > 章纲
  > 待确认设定
  > 灵感草稿
```

If the user's current instruction conflicts with `已确认设定.md` or completed prose, report the conflict and ask whether to update the formal setting before writing.

## File Placement Map

| Material | Primary destination |
| --- | --- |
| World rules and setting facts | `01_设定资料库/世界观.md` |
| Power systems, magic systems, laws, limits | `01_设定资料库/规则系统.md` |
| Factions, organizations, groups | `01_设定资料库/势力.md` |
| Places, cities, routes, rooms, landmarks | `01_设定资料库/地点.md` |
| Backstory, eras, historical events | `01_设定资料库/历史.md` |
| Terms, names, aliases, vocabulary | `01_设定资料库/术语表.md` |
| Character list and basic status | `02_角色资料库/角色总表.md` |
| Protagonist-specific material | `02_角色资料库/主角.md` |
| Supporting cast | `02_角色资料库/主要配角.md` |
| Antagonists | `02_角色资料库/反派.md` |
| Relationships | `02_角色资料库/角色关系.md` |
| Current character state | `02_角色资料库/角色状态.md` and snapshots only if confirmed/current |
| Confirmed canon summary | `06_状态快照/已确认设定.md` |
| Already written facts | `06_状态快照/事实快照.md` |
| Current open context | `06_状态快照/当前上下文.md` |
| External sources | `07_参考资料/资料索引.md` or `07_参考资料/外部资料/` |

Do not duplicate every detail into every file. Write detailed material in the primary destination and summarize only durable canon in snapshots.

## Update Procedure

1. State the target project.
2. Read the required context.
3. Classify each user-provided item.
4. Detect conflicts against confirmed settings and written facts.
5. If conflicts exist, stop and ask for confirmation before writing.
6. If safe, write each item to the correct file section.
7. Update `已确认设定.md` only for explicitly confirmed canon.
8. Update `事实快照.md` only for facts already written or explicitly established as current fact.
9. End with a bible update report.

## Bible Update Report

After organizing material, report:

```text
目标项目：
已写入：
标为待确认：
标为灵感草稿：
外部参考：
发现的冲突：
需要用户确认：
下一步建议：
```

If no files were changed, say why.

## Stop And Ask First

Stop before writing when:

- Target novel project is missing.
- The requested update would overwrite or contradict confirmed canon.
- User asks to delete existing bible files, snapshots, or completed prose.
- External material is being promoted to canon without a clear selection.
- The material belongs to multiple novels.
- The user asks for a full outline or prose scene instead of bible organization.

Ask only the single most important question needed to proceed.

## Common Cases

### Mixed Confirmed And Unconfirmed Setting

Input: `整理到《旧城月》：已确认城市叫南亭；主角可能是医生，也可能是骗子。`

Expected behavior:

- Write `南亭` as confirmed setting.
- Put the protagonist occupation under pending.
- Do not put occupation alternatives in `已确认设定.md`.

### Canon Conflict

Input: `已确认城市叫南亭。现在改成北亭，先整理进去。`

Expected behavior:

- Detect the conflict.
- Ask whether to update formal canon from `南亭` to `北亭`.
- Do not silently overwrite.

### External Reference

Input: `把网上看到的现实城市资料整理进世界观。`

Expected behavior:

- Store as reference or pending adaptation notes.
- Ask which parts should become canon.

### Character Relationship

Input: `林照是主角，已确认；他和沈砚可能是兄弟，也可能只是旧友。`

Expected behavior:

- Add `林照` as confirmed protagonist.
- Mark the relationship to `沈砚` as pending.
- Do not update current relationship snapshots as fact.

## Common Mistakes

| Mistake | Correct behavior |
| --- | --- |
| Treating “可能” as canon | Mark as 待确认 |
| Copying all notes into `已确认设定.md` | Only confirmed canon goes there |
| Updating snapshots with speculative ideas | Snapshots represent current facts |
| Resolving conflicts creatively | Ask the user |
| Mixing two novel projects | Stop and ask scope |
| Turning research into setting automatically | Keep it in references until adopted |

## Relationship to Other Skills

- Use `novel-workspace-router` first when the target or task type is unclear.
- Use `novel-project-initializer` first if the target novel project does not exist.
- Use `novel-plot-architect` for plot, outline, foreshadowing, conflict chains, and timelines.
- Use `novel-continuity-checker` when checking existing prose against the bible.
- Use `novel-research-scout` for web, GitHub, market, ranking, or source-backed research.
