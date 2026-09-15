#!/usr/bin/env bash
set -Eeuo pipefail
ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
"$ROOT/scripts/preflight.sh"
args=(--env-file "$ROOT/deploy/compose/.env" -f "$ROOT/deploy/compose/compose.yaml")
if [[ ${1:-} == --dry-run ]]; then docker compose "${args[@]}" config; exit; fi
docker compose "${args[@]}" pull
docker compose "${args[@]}" up -d --remove-orphans
"$ROOT/scripts/verify-deployment.sh"
