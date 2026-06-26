---
name: novel-workspace-router
description: Use when the user works in a multi-novel writing workspace, asks about 小说项目, novel agent/skill planning, 新建小说, 整理设定, 写正文, 审校, 查资料, 导出, or gives a novel task without a clear target project.
---

# Novel Workspace Router

## Core Principle

Route first, act second. This skill protects a multi-novel workspace from mixed context, accidental overwrites, and cross-project contamination.

Use it as the first step for novel-related work in `/Users/yao/Documents/小说项目` or any workspace that follows the same `_agent/`, `_skills/`, `_templates/`, `_research/`, and per-novel directory pattern.

## What This Skill Does

- Classify the user's request.
- Decide whether the task is workspace-level, single-novel-level, external-reference-level, or export-level.
- Locate the target novel project when needed.
- Stop and ask for the missing project name when a single-novel task has no clear target.
- Recommend the next specialized skill or workflow.
- Prevent writing specific novel content into workspace-level files.

## What This Skill Does Not Do

- Do not write prose, chapters, scenes, or dialogue.
- Do not design a concrete world, plot, character, or genre.
- Do not organize concrete novel settings beyond identifying which skill should handle them.
- Do not mutate confirmed settings, state snapshots, or existing chapters.
- Do not install or author other skills unless the user explicitly asks for skill work.

## Required Context

When available, read these files before making a routing decision:

1. `_agent/operating-rules.md`
2. `_agent/workflow-map.md`
3. `_agent/skill-roadmap.md`
4. `_agent/novel-agent-system-design.md`

If these files are missing, infer the route from the directory layout and say which rule files were unavailable.

## Task Classification

Classify each user request into one primary type.

| Type | Signals | Route |
| --- | --- | --- |
| Workspace planning | agent, skill, template, workflow, operating rules, 工作区, 根目录 | Work in `_agent/`, `_skills/`, `_templates/`, or `_research/` |
| New novel initialization | 新建一本小说, 新书名, 创建项目, 起草新项目 | Route to `novel-project-initializer` |
| Single-novel maintenance | 整理设定, 角色, 大纲, 正文, 审校, 润色, 伏笔, 时间线 for a named project | Route to the target novel directory |
| External reference | 检索, GitHub, 扫榜, 拆文, 查资料, 市场, 工具 | Route to `_research/` or the novel's `07_参考资料/` |
| Export | 导出, docx, pdf, epub, 投稿版, 存档版 | Route to `novel-export-packager` |
| Ambiguous | Novel task with no target project or unclear scope | Ask one clarifying question before writing |

## Routing Procedure

1. State the inferred task type.
2. State whether a target novel project is required.
3. If required, identify the target directory or say it is missing.
4. Name the next skill or workflow.
5. State whether file writes are allowed immediately.
6. If the task can proceed safely, continue with the requested action using the relevant workflow.
7. If the task is unsafe or under-specified, ask only the most important clarifying question.

## Output Format

For non-trivial requests, start with this compact routing block:

```text
任务类型：
目标项目：
下一步：
写入权限：
原因：
```

Then continue with the action only if the route is safe.

For simple workspace-planning requests, a one-sentence routing note is enough before acting.

## Safety Rules

- If the user asks to write a chapter, scene, setting, character profile, outline, or revision but does not name a novel project, stop and ask which project to use.
- If the user is in the root workspace and asks for concrete novel content, do not create it in the root.
- If the task mentions multiple novels, ask whether the work is comparative, shared-reference, or project-specific.
- If a task would change confirmed settings, existing chapters, state snapshots, character fate, or major plot facts, require confirmation before writing.
- If external research is requested, write findings as reference material first, not confirmed canon.
- If the request is about creating or changing skills, treat it as workspace-level unless the user says it belongs to one novel only.

## Directory Signals

Workspace-level directories usually include:

```text
_agent/
_skills/
_templates/
_research/
```

Single-novel directories usually include:

```text
00_项目总纲/
01_设定资料库/
02_角色资料库/
03_剧情结构/
04_正文草稿/
05_修订与审校/
06_状态快照/
07_参考资料/
08_导出/
```

If both patterns are present, prefer the user's explicit project name over the current working directory.

## Common Examples

Input: `继续规划 skill`

Output route:

```text
任务类型：工作区规划
目标项目：不需要
下一步：维护 _agent/ 或 _skills/
写入权限：允许写入工作区级文件
原因：请求的是 agent/skill 系统，不是具体小说内容。
```

Input: `帮我写第一章`

Output route:

```text
任务类型：单本小说维护
目标项目：未指定
下一步：暂不写正文
写入权限：不允许
原因：正文任务必须绑定具体小说目录，避免写错项目。
```

Then ask: `要写哪一本小说的第一章？`

Input: `新建一本小说，名字叫《星尘渡口》`

Output route:

```text
任务类型：新小说初始化
目标项目：星尘渡口
下一步：novel-project-initializer
写入权限：允许创建新项目目录，前提是不覆盖已有目录
原因：用户明确提供了新项目名称。
```

## Handoff Map

| User intent | Next skill or workflow |
| --- | --- |
| Create a new novel project | `novel-project-initializer` |
| Organize worldbuilding, roles, locations, terminology | `novel-bible-manager` |
| Build or revise outlines, conflicts, foreshadowing, timeline | `novel-plot-architect` |
| Write prose from approved context | `novel-draft-writer` |
| Check continuity and state drift | `novel-continuity-checker` |
| Maintain style samples and voice rules | `novel-style-keeper` |
| Revise prose while preserving intent | `novel-revision-desk` |
| Search web, GitHub, rankings, references | `novel-research-scout` |
| Export publishable or archive files | `novel-export-packager` |

If the named next skill is not installed, follow the corresponding workflow from `_agent/workflow-map.md` when enough context exists.
