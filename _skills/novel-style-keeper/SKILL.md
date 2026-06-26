---
name: novel-style-keeper
description: Use when the user wants to preserve, extract, compare, or repair a novel's style, 文风, 口吻, 去AI味, 对白风格, 叙述密度, 禁用表达, 角色声音, 风格样本, or style consistency for a named novel project.
---

# Novel Style Keeper

## Core Principle

Keep the voice, protect the facts. This skill maintains a novel's style system: narration habits, dialogue voice, sentence rhythm, banned expressions, style samples, and character-specific speech. It does not invent plot or change canon.

Use this after `novel-workspace-router` has identified a single target novel project. Use it with `novel-continuity-checker` when style changes might affect facts or character state.

## When to Use

Use when the user asks to:

- 提炼文风, 保持文风, 统一风格, 去 AI 味.
- Build style rules from the user's own samples.
- Compare a draft against the project's style target.
- Maintain character-specific dialogue and narration rules.
- Create or update banned expressions, preferred phrasing, rhythm, and tone notes.
- Polish style without changing plot, canon, or character facts.

Do not use for:

- Writing full chapters from an outline.
- Changing plot, worldbuilding, character fate, or timeline.
- Deep continuity checking unrelated to style.
- Exporting manuscripts.
- Precisely imitating a living author or a single modern writer's protected style.

## Required Target

A target novel project is required.

If the user does not name a novel project and the current directory is not clearly inside one, stop and ask:

```text
要维护哪一本小说的文风？
```

Do not write project-specific style rules into the workspace root, `_agent/`, `_skills/`, `_templates/`, or `_research/`.

## Read Before Working

Read the smallest relevant set:

1. `00_项目总纲/项目说明.md`
2. `00_项目总纲/读者体验.md` when available
3. `00_项目总纲/禁止事项.md` when available
4. `05_修订与审校/风格修订.md`
5. `06_状态快照/已确认设定.md` when rewriting could affect facts
6. Relevant character files under `02_角色资料库/` when dialogue is involved
7. The user's provided style sample or target draft

If no style sample exists, ask for one or produce only a provisional style checklist.

## Style Dimensions

Analyze and record style through concrete dimensions:

| Dimension | What to capture |
| --- | --- |
| Narrative distance | Close, distant, observational, interior, ironic, restrained |
| Sentence rhythm | Short/long balance, clause density, punctuation habits, paragraph length |
| Description density | Sparse, image-heavy, sensory, action-led, dialogue-led |
| Dialogue habits | Directness, subtext, dialect level, pauses, evasions, character-specific phrasing |
| Emotional temperature | Cold, warm, tense, comic, bleak, lyrical, restrained |
| Imagery and metaphor | Preferred domains, repeated motifs, forbidden cliches |
| Information delivery | Exposition style, reveal timing, scene vs summary balance |
| Banned expressions | AI-ish phrases, generic transitions, overused adjectives, author-disliked wording |
| Character voice | Speech rhythm, vocabulary, silence patterns, relationship-dependent tone |

Avoid vague labels unless they are translated into visible textual behaviors.

## Safe Style Handling

Allowed:

- Extract rules from the user's own writing samples.
- Transform a direct author request into broad, non-exclusive style traits.
- Maintain project-specific style consistency.
- Suggest line-level revisions that preserve facts.
- Create a style checklist before rewriting.

Not allowed:

- Precisely imitate a living author or single contemporary writer.
- Present rewritten text as "in the exact style of" a living author.
- Flatten all character voices into one house voice.
- Change plot, facts, canon, timeline, injury state, relationship state, or character knowledge while polishing.
- Use style polishing as a reason to overwrite completed prose without confirmation.

When the user asks for exact imitation of a living author, respond by offering a high-level alternative:

```text
我不能精确模仿这位作者，但可以提炼非专属的高层风格目标，例如叙述距离、节奏、意象密度、对白含蓄程度和情绪温度。
```

## File Placement Map

| Material | Primary destination |
| --- | --- |
| Project style rules | `05_修订与审校/风格修订.md` |
| Banned expressions | `00_项目总纲/禁止事项.md` or `05_修订与审校/风格修订.md` |
| Reader experience target | `00_项目总纲/读者体验.md` |
| Character dialogue rules | `02_角色资料库/角色关系.md` or relevant character file |
| Style audit findings | `05_修订与审校/审校记录.md` or `问题清单.md` |
| Revised prose | Only target draft/chapter when user confirms replacement or asks for a separate revision draft |

If writing a revision draft, prefer adding a new section or separate draft note over overwriting completed prose.

## Output Formats

### Style Extraction

```text
目标项目：
样本来源：
文风规则：
- 叙述距离：
- 句式节奏：
- 描写密度：
- 对白习惯：
- 情绪温度：
- 意象偏好：
- 信息释放：
禁用表达：
角色声音差异：
待确认问题：
```

### Style Audit

```text
目标项目：
检查范围：
总体判断：
偏离文风的位置：
AI 味 / 泛化表达：
角色口吻问题：
不建议改动的内容：
修订建议：
```

### Style Revision Report

```text
目标项目：
修订范围：
保留不变：
调整内容：
可能影响的事实：
需要用户确认：
```

## Work Procedure

1. State the target project and style task.
2. Read relevant project style, reader experience, bans, character voice, and target text.
3. Determine whether the user wants extraction, audit, or revision.
4. If extracting style, turn examples into concrete rules.
5. If auditing, identify style drift and AI-ish patterns without rewriting by default.
6. If revising, preserve plot, canon, timeline, character state, and information state.
7. Keep character voices distinct.
8. Write style notes only when safe and requested.
9. End with a style report.

## Stop And Ask First

Stop before writing when:

- Target novel project is missing.
- No style sample exists and the user expects project-specific style.
- The request asks for exact imitation of a living author.
- Style changes would alter canon, timeline, plot, character state, or relationship state.
- The user asks to overwrite completed prose without specifying replacement scope.
- The task is actually plot architecture, continuity checking, or full drafting.

Ask only the single most important question needed to proceed.

## Common Cases

### User-Owned Style Sample

Input: `这是我自己写的样本，帮《旧城月》提炼文风规则。`

Expected behavior:

- Extract concrete style dimensions.
- Write or propose updates to `风格修订.md`.
- Do not change the sample unless asked.

### Remove AI Feel

Input: `把第一章去 AI 味，但不要改变剧情和角色事实。`

Expected behavior:

- Identify generic phrasing, over-explaining, flat transitions, and unnatural emotional labels.
- Preserve plot and facts.
- Provide a revision draft only if requested or safe.

### Character Voice Protection

Input: `让所有角色说话更统一。`

Expected behavior:

- Explain that style consistency should not erase character voice.
- Propose shared narration rules plus separate character dialogue rules.

### Living Author Style

Input: `完全写成某位在世作家的风格。`

Expected behavior:

- Refuse exact imitation.
- Offer high-level, non-exclusive style traits instead.

## Common Mistakes

| Mistake | Correct behavior |
| --- | --- |
| Treating "去 AI 味" as permission to rewrite plot | Preserve facts |
| Making every character sound alike | Maintain character voice profiles |
| Using vague style words only | Translate into textual behaviors |
| Copying a living author's style | Offer high-level alternative |
| Updating canon during polish | Ask or route to continuity/bible skills |
| Overwriting completed prose | Create a revision draft or confirm replacement |

## Relationship to Other Skills

- Use `novel-workspace-router` first when the target or task type is unclear.
- Use `novel-bible-manager` when style notes depend on canon or terminology.
- Use `novel-continuity-checker` when style revision may alter facts or state.
- Use `novel-draft-writer` when the user wants new prose from an outline.
- Use `novel-revision-desk` for broader prose revision after style constraints are known.

