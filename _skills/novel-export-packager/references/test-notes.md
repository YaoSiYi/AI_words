# novel-export-packager test notes

Use these notes when manually testing the skill.

## Scope

`novel-export-packager` assembles existing novel material into submission or archive packages. It inventories source files, checks package completeness, writes export outputs, and reports what was included. It does not draft, revise, research, or update canon.

## Manual checks

1. Missing project requests should ask for the target novel project before export.
2. Export scope should be explicit: whole book, volume, chapter range, selected files, or archive snapshot.
3. Missing chapters should be reported, not filled during export.
4. Submission packages should preserve prose content and use `08_导出/投稿版/`.
5. Archive packages should use `08_导出/存档版/` and include a manifest.
6. Existing export folders should not be overwritten without explicit confirmation.
7. `.docx` and `.pdf` requests should use the proper document or PDF workflow and include verification status.
8. Platform-specific formatting should be verified or treated as an unverified checklist.

## Regression traps

- Do not mix chapters from multiple projects.
- Do not silently reorder chapters when filenames are ambiguous.
- Do not edit source drafts while exporting.
- Do not treat export artifacts as canonical source.
- Do not delete older exports without explicit user instruction and a safe path review.

## Known limitation

This skill defines package behavior and safety gates. It does not bundle a deterministic exporter script yet. If a future repeated export pattern stabilizes, add a script only after writing tests for filename ordering, manifest generation, and overwrite behavior.
