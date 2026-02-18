#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$ROOT_DIR/.env"

ok=0
warn=0

echo "== OpenClaw Doctor =="

if [ -x "$OPENCLAW_BIN" ]; then
  echo "[OK] openclaw bin: $OPENCLAW_BIN"; ok=$((ok+1))
else
  echo "[WARN] openclaw bin missing: $OPENCLAW_BIN"; warn=$((warn+1))
fi

if [ -f "$OPENCLAW_CONFIG" ]; then
  echo "[OK] config exists: $OPENCLAW_CONFIG"; ok=$((ok+1))
else
  echo "[WARN] config missing: $OPENCLAW_CONFIG"; warn=$((warn+1))
fi

if [ -x "$OPENCLAW_BIN" ]; then
  "$OPENCLAW_BIN" status >/dev/null 2>&1 && echo "[OK] openclaw status reachable" || { echo "[WARN] openclaw status failed"; warn=$((warn+1)); }
fi

echo "Summary: OK=$ok WARN=$warn"
[ "$warn" -eq 0 ] && echo "GREEN" || echo "YELLOW"
