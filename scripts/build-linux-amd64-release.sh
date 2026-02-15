#!/usr/bin/env bash
set -euo pipefail

OUT_BIN="xray-linux-64"

GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build \
  -o "${OUT_BIN}" \
  -trimpath \
  -buildvcs=false \
  -ldflags='-s -w -buildid=' \
  -v ./main

sha256sum "${OUT_BIN}" > "${OUT_BIN}.sha256"

echo "Built ${OUT_BIN}"
echo "SHA256: $(cut -d' ' -f1 "${OUT_BIN}.sha256")"
