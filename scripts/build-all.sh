#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
REPO_NAME="${REPO_NAME:-slides}"

echo "→ Building all decks (base path: /$REPO_NAME/)"

rm -rf "$ROOT_DIR/dist"
mkdir -p "$ROOT_DIR/dist"

for deck_dir in "$ROOT_DIR"/decks/*/; do
  [ -d "$deck_dir" ] || continue
  deck_name="$(basename "$deck_dir")"
  echo ""
  echo "=== Building: $deck_name ==="
  (
    cd "$deck_dir"
    if [ ! -d node_modules ]; then
      npm install --no-audit --no-fund
    fi
    npx slidev build --base "/$REPO_NAME/$deck_name/" --out "$ROOT_DIR/dist/$deck_name"
  )
done

cp "$ROOT_DIR/index.html" "$ROOT_DIR/dist/index.html"

echo ""
echo "✓ Built to $ROOT_DIR/dist/"
