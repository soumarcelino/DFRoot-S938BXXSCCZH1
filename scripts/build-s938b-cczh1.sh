#!/usr/bin/env bash
set -euo pipefail
ROOT="$(git rev-parse --show-toplevel)"
KSU_DIR="${KSU_DIR:-$ROOT/.cache/kernel-su-next-S938BXXSCCZH1}"
KSU_REPO="${KSU_REPO:-https://github.com/soumarcelino/kernel-su-next-S938BXXSCCZH1.git}"
if [[ ! -d "$KSU_DIR/.git" ]]; then
  mkdir -p "$(dirname "$KSU_DIR")"
  git clone --depth=1 "$KSU_REPO" "$KSU_DIR"
fi
"$KSU_DIR/scripts/build-s938b-cczh1.sh"
cp "$KSU_DIR/out/S938BXXSCCZH1/ksud-next-v3.4.0-samsung-S938BXXSCCZH1" "$ROOT/app/src/main/assets/ksud"
"$ROOT/gradlew" -p "$ROOT" assembleDebug
apk="$(find "$ROOT/app/build/outputs/apk/debug" -type f -name '*.apk' | head -n1)"
cp "$apk" "$ROOT/dirtyfrag.apk"
sha256sum "$ROOT/dirtyfrag.apk" "$ROOT/app/src/main/assets/ksud"
