#!/usr/bin/env bash
set -Eeuo pipefail
ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
[[ ${PREVIOUS_ALBIREO_IMAGE:-} =~ @sha256:[a-f0-9]{64}$ ]] || { echo "FAIL: set PREVIOUS_ALBIREO_IMAGE to an approved digest" >&2; exit 1; }
export ALBIREO_IMAGE=$PREVIOUS_ALBIREO_IMAGE
docker compose --env-file "$ROOT/deploy/compose/.env" -f "$ROOT/deploy/compose/compose.yaml" pull
docker compose --env-file "$ROOT/deploy/compose/.env" -f "$ROOT/deploy/compose/compose.yaml" up -d
"$ROOT/scripts/verify-deployment.sh"
