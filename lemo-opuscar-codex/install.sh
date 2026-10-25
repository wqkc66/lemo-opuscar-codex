#!/usr/bin/env sh
set -eu
scope="${1:-user}"
src=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
case "$scope" in
  user) dest="${CODEX_HOME:-$HOME/.codex}/skills/lemo-opuscar" ;;
  project) dest="$(pwd)/.agents/skills/lemo-opuscar" ;;
  *) echo "Usage: $0 [user|project]" >&2; exit 2 ;;
esac
mkdir -p "$(dirname "$dest")"
rm -rf "$dest"
mkdir -p "$dest"
cp "$src/SKILL.md" "$dest/"
cp -R "$src/references" "$src/scripts" "$dest/"
printf 'Installed lemo-opuscar to %s\n' "$dest"
