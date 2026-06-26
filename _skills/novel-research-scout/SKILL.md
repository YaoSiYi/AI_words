---
name: novel-research-scout
description: Use when the user wants novel research, 查资料, 考据, source-backed fact checking, worldbuilding references, historical or current details, profession research, location research, technology research, or to save sourced reference notes for a named novel project.
---

# Novel Research Scout

## Core Principle

Research feeds the reference shelf, not the canon shelf. This skill gathers, verifies, and organizes outside information for fiction writing while separating evidence, inference, and creative adaptation.

Use this after `novel-workspace-router` has identified a target project when the research is project-specific. If the user only wants a quick unsaved answer, provide a standalone research brief and do not write files.

## What This Skill Handles

- Historical, cultural, geographical, occupational, scientific, technical, legal, medical, economic, and current-affairs research for fiction.
- Source-backed fact checking and uncertainty notes.
- Research briefs that convert facts into story-useful possibilities.
- Source quality ranking and citation cleanup.
- Saving reference notes under a named project's `07_参考资料/`.

Do not use this skill to:

- Confirm canon by itself.
- Rewrite the world bible, plot outline, character bible, or chapter draft.
- Provide legal, medical, financial, or safety advice as professional guidance.
- Give actionable instructions for wrongdoing, evading security, building weapons, or causing harm.
- Copy long copyrighted source text.

## Project And Save Rules

A named project is required before saving any research note.

If the user asks to save but the project is missing, ask:

```text
要把资料保存到哪一本小说项目？
```

If the user asks a general research question without saving, answer as a standalone brief and state that it has not been written into any project.

Never save project-specific research in the workspace root, `_agent/`, `_skills/`, `_templates/`, or `_research/` unless the user explicitly asks for agent-planning research rather than novel-project research.

## Read Before Researching

For project-specific research, inspect the smallest relevant set:

1. `00_项目总纲/项目说明.md`
2. `00_项目总纲/读者体验.md` when available
3. `00_项目总纲/禁止事项.md` when available
4. Relevant world, character, outline, or snapshot files connected to the research question
5. `07_参考资料/资料索引.md`
6. Existing relevant notes under `07_参考资料/外部资料/`

Do not read unrelated drafts or private project material unless needed for the research question.

## When To Browse

Use online verification when information may be current, contested, niche, technical, legal, medical, financial, scientific, statistical, or source-sensitive.

Browse by default for:

- Laws, regulations, prices, schedules, current public figures, companies, products, software versions, and news.
- Technical or scientific details where primary sources exist.
- Historical claims where citations matter.
- Any user request that says "最新", "查一下", "检索", "来源", "全网", "引用", or "核实".

If network access is unavailable, say so clearly. Provide a research plan or a memory-based sketch only if labeled as unverified.

## Source Quality

Prefer sources in this order when available:

1. Primary sources: official laws, government pages, institutional reports, standards, datasets, original papers.
2. Academic, library, museum, archive, encyclopedia, or reputable publisher materials.
3. Established news organizations for current events, with date and context.
4. Specialist blogs or forums only as perspective, never as sole proof.
5. Search result snippets only as leads, not as citations.

For each important claim, record at least one source. For contested claims, record disagreement and avoid false certainty.

## Evidence Layers

Always keep these layers distinct:

| Layer | Meaning |
| --- | --- |
| Evidence | What a source actually supports |
| Inference | What can be reasonably concluded from the evidence |
| Fictional adaptation | How the idea might be transformed for the novel |
| Canon candidate | What could enter the story bible after user confirmation |

Do not move a canon candidate into `01_设定资料库/`, `02_角色资料库/`, `03_剧情结构/`, or `06_状态快照/` without explicit confirmation and the appropriate downstream skill.

## Safety And Sensitivity

For harmful or illegal procedural research, keep the answer high-level and narrative-safe:

- Discuss risk, consequences, constraints, detection, social dynamics, or fictional alternatives.
- Avoid step-by-step methods, operational checklists, tool lists, evasion tactics, exploit details, or instructions that enable harm.
- If saving, label the note as safety-filtered creative reference.

For real people, recent tragedies, private individuals, or living organizations:

- Avoid defamatory claims and unsupported allegations.
- Avoid turning identifiable private details into fiction without transformation.
- Use composite inspiration rather than direct copying when appropriate.

## Copyright Handling

Do not reproduce full articles, book chapters, or long copyrighted passages. Summarize and paraphrase. Use short quotations only when necessary and with source attribution.

When the user provides a source and asks for extraction:

- Summarize story-relevant points.
- Capture source title, author or organization when available, date, URL, and access date.
- Quote only brief excerpts that are necessary for accuracy.

## Output Contract

For a research brief:

```markdown
目标项目：
研究问题：
检索状态：
资料范围：

结论摘要：
证据：
推断：
小说可用素材：
不确定点：
风险与避坑：
可入设定候选：
来源：
建议下一步：
```

Use `目标项目：未写入项目` for standalone research.

For a saved research note:

```markdown
# 资料标题

记录日期：
目标项目：
研究问题：
标签：

## 结论摘要

## 证据

## 推断

## 小说可用素材

## 不确定点

## 风险与避坑

## 可入设定候选

## 来源
```

## Saving Research Notes

Save only when the user asks to save.

Preferred destination:

- Research notes: `07_参考资料/外部资料/`
- Research index: `07_参考资料/资料索引.md`

Before writing:

1. Resolve the named project folder.
2. Check for existing notes with similar titles or tags.
3. Choose a clear filename using a short topic title and date when useful.
4. Preserve source URLs, source dates, and access date.
5. Update `资料索引.md` only with reference metadata, not canon claims.
6. Put canon implications under `可入设定候选` and wait for confirmation.

## Relationship With Other Novel Skills

- Use `novel-workspace-router` when the target project is unclear.
- Use `novel-bible-manager` to turn confirmed research into world, character, faction, place, or term records.
- Use `novel-plot-architect` when research changes plot structure, conflict chains, timelines, or foreshadowing.
- Use `novel-continuity-checker` when research contradicts existing canon or draft events.
- Use `novel-draft-writer` when the user wants to turn researched material into prose.
- Use `novel-revision-desk` when research should guide edits to existing prose.

## Stop And Ask First

Stop before proceeding when:

- The user asks to save research but no target project is known.
- The research request is too broad to answer usefully without scope.
- The task requires current verification but browsing or network access is unavailable.
- A source is cited but cannot be accessed and accuracy depends on it.
- The request would require actionable harmful instructions.
- The user asks to make research into canon without confirming the exact change.

Ask the single most important question needed to proceed.

## Common Cases

Missing project with save request:

```text
可以查，但保存前需要知道要放进哪一本小说项目。也可以先给你一版不写入项目的资料简报。
```

Current or legal information:

```text
这类信息会变，我需要按最新来源核验，并把来源日期和不确定点列出来；它只能作为创作参考，不当作法律建议。
```

Canon candidate:

```text
这条资料可以作为设定候选，但还不是正史。确认后应交给设定管理写入对应资料库。
```
