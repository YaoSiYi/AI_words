---
name: novel-draft-writer
description: Use when the user wants to draft novel prose, 正文草稿, 写章节, 写场景, 写对白, 根据章纲写正文, continue a chapter, or turn an approved chapter outline and project snapshots into a prose draft for a named novel project.
---

# Novel Draft Writer

## Mission

Turn an approved novel project context into prose drafts while making every new story consequence visible. Draft from the named project's confirmed context, then report what the draft may require the user to confirm or later write back.

This skill is for drafting正文. It does not replace project routing, outline design, bible management, continuity auditing, style extraction, revision, research, or export packaging.

## Hard boundaries

- Do not write a prose draft until the target novel project is known.
- Do not create a new novel project. Route setup requests to `novel-project-initializer`.
- Do not invent canon to fill missing setup. Label uncertain material as a question or ask before drafting.
- Do not silently change confirmed settings, timelines, character states, relationships, rules, or foreshadowing.
- Do not update bible, snapshot, outline, or style files in the same pass as drafting unless the user has explicitly confirmed the proposed updates.
- Do not overwrite an existing draft file without checking its current contents and getting clear permission.
- Do not write outside the named project's folder.
- Do not write project-specific drafts into the workspace root, `_agent/`, `_skills/`, `_templates/`, or `_research/`.
- Do not imitate a living author's style on request. Use the project's own style samples and rules instead.

## Required project context

Before a canon draft, identify the named project folder and inspect the relevant files that exist:

1. `00_项目总纲/项目说明.md`
2. `00_项目总纲/读者体验.md`
3. `00_项目总纲/禁止事项.md`
4. `06_状态快照/当前上下文.md`
5. `06_状态快照/已确认设定.md`
6. `06_状态快照/事实快照.md`
7. `06_状态快照/角色状态快照.md`
8. Relevant character files under `02_角色资料库/`
9. Relevant outline files under `03_剧情结构/章纲/`
10. `05_修订与审校/风格修订.md`

Read only the context needed for the requested draft. If the user asks to continue from an existing chapter, also inspect the relevant draft ending under `04_正文草稿/`.

## Draft readiness

Classify the request before drafting:

- **Canon chapter draft**: needs a named project plus an approved chapter outline or enough confirmed scene instructions from the user.
- **Scene insert**: needs the target chapter or placement, current character/location/time state, and the purpose of the scene.
- **Dialogue draft**: needs the speakers, conflict, information boundaries, and character voice notes.
- **Continuation**: needs the current ending and current context snapshot.
- **Exploratory draft**: allowed only when the user explicitly accepts that the material is not canon yet.

If a canon draft lacks an outline or enough confirmed scene instructions, ask whether to create an outline first, use an existing outline, or produce a clearly marked exploratory draft.

## Conflict handling

If the user's requested draft conflicts with confirmed canon, stop before writing the conflicting prose. Report:

- The requested element that conflicts.
- The file or remembered project fact it conflicts with.
- Practical options: revise the premise, make it a non-canon exploratory variant, or update canon through `novel-bible-manager` before drafting.

Do not solve a canon conflict by quietly rewriting the project's rules.

## Output contract

For normal drafting in chat, respond in this structure:

```markdown
目标项目：
写作范围：
依据文件：

正文草稿：

新增事实：
可能影响的角色状态：
可能影响的时间线：
可能影响的伏笔：
需要用户确认：
建议回写：
```

Keep the draft itself readable and uninterrupted. Put audit notes after the prose unless the conflict prevents drafting.

## Saving drafts

Save a draft only when the user explicitly asks to write it to disk. Use the named project's `04_正文草稿/` folder and a clear chapter filename such as `第001章.md` when that matches the project's naming pattern.

Before writing:

1. Confirm the target project folder.
2. Check whether the target file already exists.
3. If it exists, inspect it and ask before overwriting or appending unless the user already gave exact instructions.
4. Save only the draft text and concise local metadata appropriate for the project.
5. After saving, still list proposed canon and snapshot updates separately.

## Consequence ledger

After every draft, list consequences in concrete terms:

- New facts introduced by the draft.
- Character state changes, including injury, emotion, relationship, secrets, resources, and knowledge.
- Location or time changes.
- Object ownership or availability changes.
- Foreshadowing introduced, advanced, paid off, or abandoned.
- World rule implications.
- Questions that need user confirmation.

If no consequence exists in a category, write `无` instead of inventing one.

## Relationship with other novel skills

- Use `novel-workspace-router` first when the target project is unclear.
- Route setup to `novel-project-initializer`.
- Route setting, character, faction, place, and term changes to `novel-bible-manager`.
- Route outline, chapter architecture, conflict chain, timeline design, or foreshadowing plan changes to `novel-plot-architect`.
- Route deep contradiction checks to `novel-continuity-checker`.
- Route style extraction, voice repair, banned phrase cleanup, and de-AI polishing to `novel-style-keeper`.
- Route structural revision and line editing to `novel-revision-desk` when available.

## Response patterns

Missing project:

```markdown
要为哪一本小说写正文草稿？我需要先锁定项目，再读取章纲、当前上下文和状态快照，避免把设定写串。
```

Missing outline:

```markdown
这章还缺少已确认章纲。你可以让我先补章纲，也可以授权我写一版“探索草稿”。探索草稿不会自动进入正史，也不会回写状态快照。
```

Canon conflict:

```markdown
这个写法会撞到已确认设定：……
我先不写进正文。可以选三条路：调整这一幕、写成非正史探索版，或先通过设定管理更新规则。
```

After draft:

```markdown
新增事实：
- ...

建议回写：
- `06_状态快照/角色状态快照.md`：...
- `03_剧情结构/伏笔表.md`：...
```
