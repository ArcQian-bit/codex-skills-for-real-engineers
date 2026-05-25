#!/usr/bin/env bash
set -euo pipefail

repo_url="https://github.com/ArcQian-bit/codex-skills-for-real-engineers.git"
source_dir="${CODEX_REAL_ENGINEER_SOURCE_DIR:-}"
selected="${CODEX_REAL_ENGINEER_SKILLS:-all}"
codex_home="${CODEX_HOME:-$HOME/.codex}"
dest_root="$codex_home/skills"
tmp_dir=""

cleanup() {
  if [ -n "$tmp_dir" ] && [ -d "$tmp_dir" ]; then
    rm -rf "$tmp_dir"
  fi
}
trap cleanup EXIT

if [ -z "$source_dir" ]; then
  tmp_dir="$(mktemp -d)"
  git clone --depth 1 "$repo_url" "$tmp_dir/repo" >/dev/null
  source_dir="$tmp_dir/repo"
fi

skills_root="$source_dir/skills"
if [ ! -d "$skills_root" ]; then
  echo "No skills directory found at $skills_root" >&2
  exit 1
fi

mkdir -p "$dest_root"

if [ "$selected" = "all" ]; then
  skills=()
  while IFS= read -r skill_name; do
    skills+=("$skill_name")
  done < <(find "$skills_root" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort)
else
  IFS=',' read -r -a skills <<< "$selected"
fi

for skill in "${skills[@]}"; do
  skill="$(echo "$skill" | xargs)"
  if [ -z "$skill" ]; then
    continue
  fi
  if [ ! -f "$skills_root/$skill/SKILL.md" ]; then
    echo "Unknown skill: $skill" >&2
    exit 1
  fi
  rm -rf "$dest_root/$skill"
  cp -R "$skills_root/$skill" "$dest_root/$skill"
  echo "Installed $skill -> $dest_root/$skill"
done

echo "Done. Restart Codex to pick up new skills."
