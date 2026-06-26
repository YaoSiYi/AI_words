# novel-revision-desk test notes

Use these notes when manually testing the skill.

## Scope

`novel-revision-desk` revises existing prose. It can audit, polish, line edit, tighten pacing, repair dialogue, and produce a separate revision draft. It does not draft new chapters from outlines, change canon, or silently update project facts.

## Manual checks

1. Missing project or missing source text should produce a targeted question, not a generic rewrite.
2. Safe polish should preserve plot facts, character knowledge, timeline, location, injuries, relationships, and scene outcome.
3. Plot-changing requests should be identified as architecture or continuity work before prose revision.
4. Audit-only requests should return findings and actions, not rewritten prose.
5. Dialogue-only requests should preserve narration and use character voice notes.
6. Overwrite requests should require exact path confirmation and should prefer a separate revision file or backup.
7. Living-author style requests should be transformed into high-level, non-exclusive style traits.

## Regression traps

- Do not use revision as a backdoor for new canon.
- Do not hide major plot changes under the word "polish".
- Do not overwrite source drafts without an explicit confirmation step.
- Do not update snapshots in the same pass as a prose revision.
- Do not claim a continuity audit when only a revision pass was performed.

## Known limitation

This skill does not perform a full multi-chapter continuity audit. If the revision changes events, knowledge, time, objects, injuries, relationships, or foreshadowing, route the consequence review to `novel-continuity-checker`.
