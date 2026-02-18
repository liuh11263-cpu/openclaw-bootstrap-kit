#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$ROOT_DIR/.env"

mkdir -p "$(dirname "$OPENCLAW_CONFIG")"

# render template using envsubst-like perl fallback
perl -pe 's/\$\{(\w+)\}/$ENV{$1}\/\/""/ge' \
  "$ROOT_DIR/templates/openclaw.template.json" > "$OPENCLAW_CONFIG"

echo "Wrote config: $OPENCLAW_CONFIG"

if [ -x "$OPENCLAW_BIN" ]; then
  "$OPENCLAW_BIN" gateway restart || true
else
  echo "WARN: OPENCLAW_BIN not executable: $OPENCLAW_BIN"
fi
