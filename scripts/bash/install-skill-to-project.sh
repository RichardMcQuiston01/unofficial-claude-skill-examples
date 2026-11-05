#!/usr/bin/env bash
# Copyright (c)2026 Richard McQuiston. All Rights Reserved.
#
# This copyright applies to the original code and content of this project only.
# It does not extend to, and no license is granted for, use of the "Claude"
# name or any Anthropic trademarks, which remain the property of Anthropic, PBC.

# Copy one or more skills/<name>/ folders into <project-path>/.claude/skills/.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"

usage() {
  cat <<EOF
Usage: $(basename "$0") -d|--destination <project-path> (<skill-name>... | --all)

Copy one or more skill folders from skills/ into <project-path>/.claude/skills/,
so they're shared with the project via git.

  -d, --destination <path>   Project root to install skills into (required)
  --all                      Install every skill under skills/
  -h, --help                 Show this help message
EOF
}

if [[ $# -eq 0 ]]; then
  usage
  exit 1
fi

dest=""
all=0
names=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    -d|--destination)
      dest="$2"
      shift 2
      ;;
    --all)
      all=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      names+=("$1")
      shift
      ;;
  esac
done

if [[ -z "$dest" ]]; then
  echo "Error: -d|--destination <project-path> is required." >&2
  usage
  exit 1
fi

if [[ $all -eq 1 ]]; then
  names=()
  shopt -s nullglob
  for dir in "$SKILLS_DIR"/*/; do
    name="$(basename "$dir")"
    [[ -f "$dir/SKILL.md" ]] && names+=("$name")
  done
  shopt -u nullglob
fi

if [[ ${#names[@]} -eq 0 ]]; then
  echo "No skills specified. Use --all or pass one or more skill names." >&2
  usage
  exit 1
fi

mkdir -p "$dest/.claude/skills"
dest_skills_dir="$(cd "$dest/.claude/skills" && pwd)"

failed=0
for name in "${names[@]}"; do
  src="$SKILLS_DIR/$name"
  if [[ ! -f "$src/SKILL.md" ]]; then
    echo "Skipped: $name (no SKILL.md found at $src)" >&2
    failed=1
    continue
  fi

  target="$dest_skills_dir/$name"
  if [[ -e "$target" ]]; then
    read -r -p "Overwrite $name at $target? [y/N] " reply
    if [[ ! "$reply" =~ ^[Yy]$ ]]; then
      echo "Skipped: $name (already exists, not overwritten)"
      continue
    fi
    rm -rf "$target"
  fi

  cp -R "$src" "$target"
  echo "Installed: $name -> $target"
done

exit $failed
