#!/usr/bin/env bash
set -Eeuo pipefail
ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
ENV_FILE=${ENV_FILE:-$ROOT/deploy/compose/.env}
[[ -r $ENV_FILE ]] || { echo "FAIL: copy .env.example to .env" >&2; exit 1; }
set -a; source "$ENV_FILE"; set +a
[[ ${ALBIREO_IMAGE:-} =~ @sha256:[a-f0-9]{64}$ ]] || { echo "FAIL: ALBIREO_IMAGE must use an immutable sha256 digest" >&2; exit 1; }
[[ $ALBIREO_IMAGE != *'0000000000000000000000000000000000000000000000000000000000000000' ]] || { echo "FAIL: replace the example image digest" >&2; exit 1; }
command -v docker >/dev/null || { echo "FAIL: docker missing" >&2; exit 1; }
docker compose version >/dev/null || { echo "FAIL: Compose v2 missing" >&2; exit 1; }
[[ -r $ROOT/config/albireo.yaml ]] || { echo "FAIL: copy config/albireo.example.yaml to config/albireo.yaml" >&2; exit 1; }
[[ -d $ROOT/deploy/compose/secrets ]] || { echo "FAIL: secrets directory missing" >&2; exit 1; }
find "$ROOT/deploy/compose/secrets" -type f ! -name README.md -perm /007 -print -quit | grep -q . && { echo "FAIL: a secret file is accessible to others" >&2; exit 1; } || true
echo "PASS: deployment prerequisites validated"
