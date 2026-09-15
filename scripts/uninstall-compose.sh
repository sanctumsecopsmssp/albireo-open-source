#!/usr/bin/env bash
set -Eeuo pipefail
ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
[[ ${CONFIRM_UNINSTALL:-} == yes ]] || { echo "Refusing uninstall; set CONFIRM_UNINSTALL=yes" >&2; exit 1; }
args=(--env-file "$ROOT/deploy/compose/.env" -f "$ROOT/deploy/compose/compose.yaml" down)
if [[ ${PURGE_DATA:-no} == yes ]]; then args+=(--volumes); else echo "Preserving albireo-data volume"; fi
docker compose "${args[@]}"
