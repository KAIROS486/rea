#!/bin/bash
# Installs Ghidra 12.1.4 for REA in Claude Code cloud sessions (skipped locally).
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

GHIDRA_DIR=/opt/ghidra_12.1.4_PUBLIC
GHIDRA_URL=https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_12.1.4_build/ghidra_12.1.4_PUBLIC_20260921.zip
GHIDRA_SHA256=ddac49f903da9d5bac833e5cc79395098b9c33cfd3279be5f31bd00387d2d4db

if [ ! -x "$GHIDRA_DIR/support/analyzeHeadless" ]; then
  tmp=$(mktemp -d)
  trap 'rm -rf "$tmp"' EXIT
  curl -sSLf -o "$tmp/ghidra.zip" "$GHIDRA_URL"
  echo "$GHIDRA_SHA256  $tmp/ghidra.zip" | sha256sum -c --quiet
  unzip -q "$tmp/ghidra.zip" -d /opt
fi

if ! command -v javac >/dev/null 2>&1; then
  apt-get install -y -qq openjdk-21-jdk-headless >/dev/null
fi
