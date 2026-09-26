#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUT="${TMPDIR:-/tmp}/cf_amux_tb"
iverilog -g2005 -o "$OUT" \
  "$ROOT/hdl/gl/CF_AMUX.v" \
  "$ROOT/verify/beh_model/CF_AMUX_core.v" \
  "$ROOT/verify/beh_model/tb_CF_AMUX.v"
vvp "$OUT"
