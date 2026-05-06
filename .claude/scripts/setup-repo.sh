#!/usr/bin/env bash
set -euo pipefail

NEW_NAME="${1:?Usage: setup-repo.sh <new-folder-name>}"
CURRENT_DIR="$(pwd)"
PARENT_DIR="$(dirname "$CURRENT_DIR")"
CURRENT_NAME="$(basename "$CURRENT_DIR")"

if [ "$CURRENT_NAME" = "$NEW_NAME" ]; then
  echo "Folder is already named '$NEW_NAME'. Skipping rename."
  NEW_DIR="$CURRENT_DIR"
else
  NEW_DIR="$PARENT_DIR/$NEW_NAME"
  if [ -e "$NEW_DIR" ]; then
    echo "Error: '$NEW_DIR' already exists. Choose a different name." >&2
    exit 1
  fi

  UPSTREAM_URL="$(git remote get-url origin 2>/dev/null || true)"

  echo "Renaming folder: $CURRENT_NAME → $NEW_NAME"
  mv "$CURRENT_DIR" "$NEW_DIR"
  cd "$NEW_DIR"

  if [ -n "$UPSTREAM_URL" ]; then
    echo "Preserving template remote as 'upstream': $UPSTREAM_URL"
    git remote add upstream "$UPSTREAM_URL"
    git remote remove origin
    echo "Removed 'origin' (will be set to your new repo)."
  else
    echo "No existing origin remote found — skipping upstream setup."
  fi
fi

cd "$NEW_DIR"

echo ""
echo "Creating private GitHub repo: $NEW_NAME"
gh repo create "$NEW_NAME" --private --source=. --remote=origin --push

echo ""
echo "Done. Your personalized brain is live at: $(gh repo view --json url -q .url)"
echo ""
echo "Next: close Claude Code and reopen it in '$NEW_DIR'."
