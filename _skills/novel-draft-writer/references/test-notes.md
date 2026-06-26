# novel-draft-writer test notes

Use these notes when manually testing the skill.

## Scope

`novel-draft-writer` turns approved project context into prose drafts. It is not a plot architect, bible editor, continuity auditor, or revision desk. Its main job is to draft scenes while making every new consequence visible.

## Manual checks

1. Missing project requests should ask for the target novel project and should not draft.
2. Canon drafting should require a named project and read approved context before producing prose.
3. Missing outline requests should ask whether to create an outline first or produce an exploratory non-canon draft.
4. Canon conflicts should stop the draft and ask for a decision.
5. Saving a chapter draft should stay under the named project's `04_正文草稿/` folder.
6. Snapshot, bible, timeline, and foreshadowing updates should be proposed after drafting, not silently written.

## Regression traps

- The skill must not invent a root-level novel or write loose drafts outside a named project.
- The skill must not treat exploratory drafts as confirmed canon.
- The skill must not update canonical state files in the same pass as prose generation unless the user confirms the proposed updates.
- The skill must not override voice, style, or banned-expression rules recorded by `novel-style-keeper`.
- The skill must not claim a full continuity audit; route deeper checks to `novel-continuity-checker`.

## Known limitation

This skill does not spawn subagents by itself. If the user later asks for parallel drafting, review, and continuity work, the main agent should coordinate those steps explicitly and keep canonical writes gated by confirmation.
