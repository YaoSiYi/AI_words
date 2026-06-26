#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
TARGET_DIR="$CODEX_HOME_DIR/skills"

expected=(
  novel-workspace-router
  novel-project-initializer
  novel-bible-manager
  novel-plot-architect
  novel-continuity-checker
  novel-style-keeper
  novel-draft-writer
  novel-revision-desk
  novel-research-scout
  novel-export-packager
)

errors=0

for skill in "${expected[@]}"; do
  for base in "$ROOT_DIR/_skills" "$TARGET_DIR"; do
    if [[ ! -f "$base/$skill/SKILL.md" ]]; then
      echo "Missing: $base/$skill/SKILL.md" >&2
      errors=$((errors + 1))
    fi
    if [[ ! -f "$base/$skill/evals/evals.json" ]]; then
      echo "Missing: $base/$skill/evals/evals.json" >&2
      errors=$((errors + 1))
    fi
    if [[ ! -f "$base/$skill/references/test-notes.md" ]]; then
      echo "Missing: $base/$skill/references/test-notes.md" >&2
      errors=$((errors + 1))
    fi
  done
done

if command -v python3 >/dev/null 2>&1; then
  for skill in "${expected[@]}"; do
    python3 -m json.tool "$ROOT_DIR/_skills/$skill/evals/evals.json" >/dev/null
    python3 -m json.tool "$TARGET_DIR/$skill/evals/evals.json" >/dev/null
  done
fi

if [[ "$errors" -ne 0 ]]; then
  echo "Verification failed with $errors missing file(s)." >&2
  exit 1
fi

echo "Verified ${#expected[@]} local and installed novel skills."
