#!/usr/bin/env bash
# Copyright (c)2026 Richard McQuiston. All Rights Reserved.
#
# This copyright applies to the original code and content of this project only.
# It does not extend to, and no license is granted for, use of the "Claude"
# name or any Anthropic trademarks, which remain the property of Anthropic, PBC.

# Package one or more skills/<name>/ folders into <name>.skill zip archives.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"
OUTPUT_DIR="$REPO_ROOT/out"

usage() {
  cat <<EOF
Usage: $(basename "$0") [-o|--output <dir>] (<skill-name>... | --all)

Package one or more skill folders under skills/ into .skill zip archives,
for uploading to Claude Desktop or Claude.ai.

  -o, --output <dir>   Output directory for the .skill files (default: $REPO_ROOT/out)
  --all                Package every skill under skills/
  -h, --help           Show this help message
EOF
}

if [[ $# -eq 0 ]]; then
  usage
  exit 1
fi

all=0
names=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    -o|--output)
      OUTPUT_DIR="$2"
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

ZIPPER=""
if command -v zip >/dev/null 2>&1; then
  ZIPPER="zip"
elif command -v python3 >/dev/null 2>&1; then
  ZIPPER="python3"
elif command -v python >/dev/null 2>&1; then
  ZIPPER="python"
else
  echo "Error: this needs either 'zip' or 'python3' on PATH, and neither was found." >&2
  exit 1
fi

mkdir -p "$OUTPUT_DIR"
OUTPUT_DIR="$(cd "$OUTPUT_DIR" && pwd)"

failed=0
for name in "${names[@]}"; do
  skill_dir="$SKILLS_DIR/$name"
  if [[ ! -f "$skill_dir/SKILL.md" ]]; then
    echo "Skipped: $name (no SKILL.md found at $skill_dir)" >&2
    failed=1
    continue
  fi

  out_file="$OUTPUT_DIR/$name.skill"
  rm -f "$out_file"
  if [[ "$ZIPPER" == "zip" ]]; then
    (cd "$SKILLS_DIR" && zip -rq "$out_file" "$name")
  else
    "$ZIPPER" - "$SKILLS_DIR" "$name" "$out_file" <<'PY'
import os, sys, zipfile

skills_dir, name, out_file = sys.argv[1], sys.argv[2], sys.argv[3]
src = os.path.join(skills_dir, name)
with zipfile.ZipFile(out_file, "w", zipfile.ZIP_DEFLATED) as zf:
    for root, _dirs, files in os.walk(src):
        for f in files:
            full = os.path.join(root, f)
            rel = os.path.join(name, os.path.relpath(full, src))
            zf.write(full, rel)
PY
  fi
  echo "Packaged: $name -> $out_file"
done

exit $failed
