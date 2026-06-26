---
name: novel-export-packager
description: Use when the user wants to export, package, assemble, archive, 投稿版, 存档版, manuscript bundle, chapter range export, docx, pdf, epub, markdown, or platform submission files for a named novel project.
---

# Novel Export Packager

## Core Principle

Export is packaging, not rewriting. This skill assembles existing project material into submission or archive outputs while preserving source text and reporting exactly what was included, skipped, normalized, or blocked.

Use this after `novel-workspace-router` has identified a single target novel project.

## What This Skill Handles

- Exporting a whole book, volume, chapter range, or selected chapters.
- Creating submission packages under `08_导出/投稿版/`.
- Creating archive packages under `08_导出/存档版/`.
- Producing export manifests, file inventories, and packaging reports.
- Preparing Markdown, plain text, `.docx`, `.pdf`, `.epub`, or platform-specific bundles when the required tools and requirements are available.

Do not use this skill to:

- Draft missing chapters.
- Revise or polish prose.
- Change canon, outlines, snapshots, or bible files.
- Research platform requirements from memory when they may have changed.
- Delete or overwrite previous exports without explicit confirmation.

## Required Target And Scope

A named project and export scope are required.

If the project is missing, ask:

```text
要导出哪一本小说项目？
```

If the scope is missing, ask:

```text
要导出整本、某一卷、章节范围，还是指定文件？
```

If the output type is missing, use a safe default of Markdown plus manifest unless the user requested a specific format.

## Read Before Exporting

Read the smallest relevant set:

1. `00_项目总纲/项目说明.md`
2. `00_项目总纲/创作目标.md` when submission metadata matters
3. `00_项目总纲/读者体验.md` when synopsis or pitch material is requested
4. `04_正文草稿/` chapter files in the requested scope
5. `03_剧情结构/卷纲/` and `03_剧情结构/章纲/` when checking expected chapter order
6. `05_修订与审校/问题清单.md` when the user asks for readiness notes
7. `06_状态快照/` when creating archive packages
8. `01_设定资料库/`, `02_角色资料库/`, and `03_剧情结构/` only when archive scope includes project context
9. Existing files under `08_导出/投稿版/` or `08_导出/存档版/` before writing

Do not read unrelated novel projects.

## Export Modes

| Mode | Destination | Includes |
| --- | --- | --- |
| Submission | `08_导出/投稿版/` | Selected manuscript, synopsis or metadata if requested, manifest, packaging report |
| Archive | `08_导出/存档版/` | Manuscript, selected bible and snapshot files, outlines, references index if requested, manifest |
| Review handoff | `08_导出/投稿版/` or user-specified folder | Manuscript plus issue checklist or revision notes |
| Platform package | `08_导出/投稿版/` | Files formatted to verified or user-provided platform requirements |

Keep source materials and export artifacts separate. Export artifacts are snapshots, not canonical source.

## Inventory First

Before writing an export, create an inventory:

- Target project.
- Requested scope.
- Source folders inspected.
- Chapter files found.
- Expected but missing chapters.
- Ambiguous filename order.
- Duplicate chapter numbers or titles.
- Existing export files that may conflict.
- Output formats requested.

If missing or ambiguous files would make the package misleading, stop and ask before exporting.

## Preservation Rules

Preserve source chapter text. Allowed packaging-only changes:

- Normalize line endings.
- Add title pages, separators, table of contents, or metadata pages when requested.
- Convert Markdown headings to format-specific headings.
- Remove internal comments only when the user asks for a clean submission copy.
- Normalize whitespace only if it does not alter prose.

Not allowed during export:

- Writing missing prose.
- Polishing wording.
- Changing chapter titles or order silently.
- Removing scenes.
- Updating canon snapshots.
- Marking exported files as the new source of truth.

Route writing to `novel-draft-writer`, revision to `novel-revision-desk`, and continuity concerns to `novel-continuity-checker`.

## Format Handling

Markdown or text:

- Assemble directly from source chapters.
- Add a manifest and packaging report.

`.docx`:

- Use the document workflow when creating or editing a Word file.
- Verify the resulting document exists and, when layout matters, render or inspect it according to the document workflow.

`.pdf`:

- Use the PDF workflow when creating, inspecting, or rendering a PDF.
- Verify visual layout when the user cares about final appearance.

`.epub`:

- Ask for or infer only safe metadata such as title and author name from project files.
- If EPUB tooling is unavailable, produce a structured export plan or Markdown package instead of claiming success.

Platform-specific package:

- Use user-provided requirements or verify current official requirements when possible.
- If requirements cannot be verified, produce a checklist and label assumptions.

## Output Contract

For a pre-export inventory:

```markdown
目标项目：
导出范围：
输出类型：
源文件：
缺失项：
顺序风险：
覆盖风险：
是否可以导出：
```

For a completed package:

```markdown
目标项目：
导出模式：
导出范围：
输出目录：
生成文件：
源文件清单：
格式处理：
未包含内容：
校验结果：
需要用户确认：
建议下一步：
```

For a manifest file:

```markdown
# 导出清单

导出时间：
目标项目：
导出模式：
导出范围：
输出格式：

## 生成文件

## 源文件

## 未包含内容

## 格式处理

## 校验结果

## 备注
```

## Saving And Overwrite Rules

Save only inside the named project's `08_导出/投稿版/` or `08_导出/存档版/` unless the user gives a specific safe destination. Do not write project-specific exports into the workspace root, `_agent/`, `_skills/`, `_templates/`, or `_research/`.

Prefer versioned folders or filenames:

- `投稿版_YYYYMMDD_HHMM/`
- `存档版_YYYYMMDD_HHMM/`
- `第001-010章_投稿版.md`
- `全书_存档版.md`

Before overwriting:

1. Inspect the existing target path.
2. Report the exact path and files that would be replaced.
3. Recommend a new versioned export when practical.
4. Ask for explicit confirmation before replacing files.
5. Do not delete old exports unless the user explicitly asks and the path is clearly within the target project's export folder.

## Relationship With Other Novel Skills

- Use `novel-workspace-router` when the project is unclear.
- Use `novel-draft-writer` when requested export scope has missing chapters the user wants created.
- Use `novel-revision-desk` when the user wants polishing before export.
- Use `novel-continuity-checker` when readiness depends on consistency across chapters.
- Use `novel-style-keeper` when the user wants style cleanup before packaging.
- Use `novel-research-scout` when platform requirements or external submission rules need current verification.

## Stop And Ask First

Stop before exporting when:

- Target project is missing.
- Export scope is missing.
- Chapter order is ambiguous.
- Required chapter files are missing and the user expects a complete package.
- Output path already exists and overwrite is implied.
- Platform requirements are unknown or may have changed.
- Requested format requires tooling that is unavailable.

Ask the single most important question needed to proceed.

## Common Cases

Missing project:

```text
要导出哪一本小说项目？我需要先锁定项目，避免把不同书的章节混在一起。
```

Missing chapters:

```text
导出前清点到这些章节缺失。我不会在导出阶段补写正文，可以先转到正文草稿流程补齐。
```

Overwrite:

```text
目标导出路径已经存在。建议生成一个新的版本目录；如果要覆盖，我需要你确认这个确切路径。
```

Platform requirements:

```text
投稿格式可能会变。你可以提供平台要求，或让我先核验当前规则；没核验前我会把格式项标为假设。
```
