#!/usr/bin/env bash
# Usage: ./find_replace.sh "search_text" "replace_text" [path]
# Example: ./find_replace.sh "foo" "bar" ./src

SEARCH="$1"
REPLACE="$2"
TARGET_DIR="${3:-.}"

if [[ -z "$SEARCH" || -z "$REPLACE" ]]; then
  echo "Usage: $0 <search> <replace> [directory]"
  exit 1
fi

# Ensure ripgrep is installed
if ! command -v rg >/dev/null 2>&1; then
  echo "Error: ripgrep (rg) is required but not installed."
  exit 1
fi

echo "Gathering files (respecting .gitignore and excluding binaries)..."

FILES=$(rg --files-with-matches --fixed-strings "$SEARCH" "$TARGET_DIR" 2>/dev/null)

if [[ -z "$FILES" ]]; then
  echo "No files found containing '$SEARCH'"
  exit 0
fi

# Apply replacement
echo "$FILES" | while IFS= read -r FILE; do
  if [[ -f "$FILE" ]]; then
    # Skip binary/media files (extra safety)
    case "$FILE" in
      *.png|*.jpg|*.jpeg|*.gif|*.svg|*.webp|*.ico|*.ttf|*.otf|*.woff|*.woff2|*.eot|*.mp4|*.mp3|*.mov|*.pdf|*.zip|*.gz|*.tar|*.7z)
        continue
        ;;
    esac
    
    # Use different sed syntax for macOS vs Linux
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' "s/${SEARCH}/${REPLACE}/g" "$FILE"
    else
      sed -i "s/${SEARCH}/${REPLACE}/g" "$FILE"
    fi
  fi
done

echo "Done! Replaced '$SEARCH' with '$REPLACE' in matching text files."

