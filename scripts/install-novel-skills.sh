#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_DIR="$ROOT_DIR/_skills"
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
TARGET_DIR="$CODEX_HOME_DIR/skills"
BACKUP_DIR="$CODEX_HOME_DIR/skills.backup.$(date +%Y%m%d_%H%M%S)"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Missing source skills directory: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

skills=()
while IFS= read -r skill_path; do
  skills+=("$skill_path")
done < <(find "$SOURCE_DIR" -mindepth 1 -maxdepth 1 -type d -name 'novel-*' ! -name '*-workspace' | sort)

if [[ "${#skills[@]}" -eq 0 ]]; then
  echo "No novel skills found under: $SOURCE_DIR" >&2
  exit 1
fi

echo "Source: $SOURCE_DIR"
echo "Target: $TARGET_DIR"

for skill_path in "${skills[@]}"; do
  skill_name="$(basename "$skill_path")"

  if [[ ! -f "$skill_path/SKILL.md" ]]; then
    echo "Skip $skill_name: missing SKILL.md" >&2
    continue
  fi

  if [[ -e "$TARGET_DIR/$skill_name" ]]; then
    mkdir -p "$BACKUP_DIR"
    rm -rf "$BACKUP_DIR/$skill_name"
    mv "$TARGET_DIR/$skill_name" "$BACKUP_DIR/$skill_name"
    echo "Backed up existing $skill_name"
  fi

  mkdir -p "$TARGET_DIR/$skill_name"
  cp -R "$skill_path/." "$TARGET_DIR/$skill_name/"
  echo "Installed $skill_name"
done

echo
echo "Installed ${#skills[@]} novel skills."
if [[ -d "$BACKUP_DIR" ]]; then
  echo "Backups: $BACKUP_DIR"
fi
echo "Restart Codex if a newly installed skill does not appear immediately."
