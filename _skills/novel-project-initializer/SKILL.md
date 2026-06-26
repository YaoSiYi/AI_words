---
name: novel-project-initializer
description: Use when the user wants to create, initialize, bootstrap, or set up a new novel project, 新建小说, 创建新书目录, 起草新项目, or turn a named novel idea into a safe project folder in a multi-novel writing workspace.
---

# Novel Project Initializer

## Core Principle

Create the container, not the novel. This skill turns a named novel idea into a safe, standardized project folder without inventing plot, characters, genre, or worldbuilding.

Use this after `novel-workspace-router` identifies a request as a new-novel initialization task.

## When to Use

Use when the user asks to:

- 新建一本小说 / 创建一本新书.
- Create a novel project from a title.
- Turn rough materials into a new project folder.
- Copy the standard novel template for a new work.
- Initialize files for settings, characters, outlines, drafts, snapshots, references, and exports.

Do not use for:

- Writing chapters, scenes, dialogue, outlines, or character arcs.
- Organizing an existing novel's bible after the project already exists.
- Exporting, revising, or checking continuity.

## Required Inputs

Minimum required input:

- A project name or novel title.

Optional inputs:

- Creation date.
- Short user-provided project note.
- Confirmed facts.
- Unconfirmed ideas or raw inspiration.
- Preferred project directory name.

If the project name is missing, stop and ask one question: `这本小说项目叫什么名字？`

## Safety Checks

Before creating anything:

1. Confirm the workspace root is the current multi-novel workspace, normally `/Users/yao/Documents/小说项目`.
2. Confirm `_templates/novel-project-template/` exists.
3. Sanitize the project directory name.
4. Reject names that contain path traversal or path separators, including `../`, `..\\`, `/`, or `\\`.
5. Strip book-title brackets such as `《》` from the directory name unless the user explicitly wants them.
6. Check whether the target directory already exists.
7. If the target exists, do not overwrite or merge. Ask whether to choose a new name, inspect the existing project, or stop.

The target path must resolve inside the workspace root.

## Initialization Procedure

1. Read `_agent/operating-rules.md` and `_agent/workflow-map.md` when available.
2. Read `_templates/novel-project-template/README.md` when available.
3. Create the target project by copying `_templates/novel-project-template/`.
4. Fill only low-risk metadata:
   - `00_项目总纲/项目说明.md`: project name, creation date, current stage.
   - `06_状态快照/当前上下文.md`: current creation position and immediate next step.
5. If the user provides confirmed facts, write them to suitable files and clearly mark them as user-confirmed.
6. If the user provides uncertain ideas, possibilities, or raw inspiration, write them only as 待确认 or 灵感草稿.
7. Do not write unconfirmed content into `06_状态快照/已确认设定.md`.
8. Do not generate missing worldbuilding, characters, plot, genre, market positioning, chapter names, or style rules.
9. End with a creation report.

## Default Template Structure

The created project should contain:

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

If the template directory is unavailable, create this structure manually and say that the fallback structure was used.

## Content Placement Rules

| Input type | Destination |
| --- | --- |
| Project name | `00_项目总纲/项目说明.md` |
| Creation goal | `00_项目总纲/创作目标.md` |
| Confirmed world rule | `01_设定资料库/世界观.md` and, if explicitly confirmed, `06_状态快照/已确认设定.md` |
| Possible or uncertain setting | `01_设定资料库/世界观.md` under 待确认设定 or 灵感草稿 |
| Character idea | `02_角色资料库/角色总表.md` or role file, marked confirmed or 待确认 |
| Raw reference material | `07_参考资料/资料索引.md` or `07_参考资料/外部资料/` |
| Current next step | `06_状态快照/当前上下文.md` |

When unsure whether content is confirmed, treat it as unconfirmed.

## Creation Report

After initialization, report:

```text
项目名称：
项目路径：
使用模板：
已创建内容：
已写入文件：
未写入/未确认内容：
下一步建议：
```

Mention any skipped content and why.

## Common Cases

### Name Only

Input: `新建一本小说，名字叫《星尘渡口》，先只建目录。`

Expected behavior:

- Create `星尘渡口/`.
- Copy the template.
- Fill project name and creation date.
- Leave settings, roles, and plot blank.
- Report the created path.

### Missing Name

Input: `新建一本小说，但是我还没想好名字。`

Expected behavior:

- Do not create a directory.
- Ask: `这本小说项目叫什么名字？`

### Unsafe Name

Input: `新建一本小说，名字叫《../测试项目》。`

Expected behavior:

- Do not create a directory.
- Explain that the name is unsafe because it could escape the workspace.
- Ask for a safe project name.

### Uncertain Inspiration

Input: `新建《旧城月》，主角可能是医生，也可能是骗子。`

Expected behavior:

- Create the project.
- Put this under 待确认 or 灵感草稿.
- Do not put it in `已确认设定.md`.

## Common Mistakes

| Mistake | Correct behavior |
| --- | --- |
| Inventing a protagonist because the file has a protagonist template | Leave it blank |
| Treating “可能” as confirmed | Mark as 待确认 or 灵感草稿 |
| Overwriting an existing project | Stop and ask |
| Creating a project outside the workspace | Reject the name or path |
| Writing external research into canon | Put it in references first |
| Asking many setup questions before creating | Ask only for missing required information |

## Relationship to Other Skills

- Use `novel-workspace-router` before this skill when the task type is unclear.
- After initialization, use `novel-bible-manager` to organize supplied worldbuilding and character material.
- Use `novel-plot-architect` only after the user asks for outline work.
- Use `novel-draft-writer` only after a target project and enough approved context exist.
