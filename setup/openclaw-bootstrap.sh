#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
[ -f "$ROOT_DIR/.env" ] && source "$ROOT_DIR/.env"

echo "[1/4] Check Homebrew"
command -v brew >/dev/null || { echo "Homebrew missing"; exit 1; }

echo "[2/4] Install base deps"
brew list jq >/dev/null 2>&1 || brew install jq
brew list node >/dev/null 2>&1 || brew install node

echo "[3/4] Install OpenClaw (global npm)"
command -v openclaw >/dev/null 2>&1 || npm i -g openclaw

echo "[4/4] Prepare workspace"
mkdir -p "${OPENCLAW_WORKSPACE:-$HOME/.openclaw/workspace}"
mkdir -p "$HOME/.openclaw"

echo "Done: bootstrap ok"
