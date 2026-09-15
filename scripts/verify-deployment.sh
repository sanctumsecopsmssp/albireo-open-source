#!/usr/bin/env bash
set -Eeuo pipefail
ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
ENV_FILE=${ENV_FILE:-$ROOT/deploy/compose/.env}
set -a; source "$ENV_FILE"; set +a
port=${ALBIREO_HEALTH_PORT:-8080}
command -v curl >/dev/null || { echo "FAIL: curl missing" >&2; exit 1; }
for endpoint in health ready; do
  code=$(curl --silent --show-error --output /dev/null --write-out '%{http_code}' --connect-timeout 3 --max-time 10 "http://127.0.0.1:$port/$endpoint" || true)
  [[ $code == 200 ]] || { echo "FAIL: /$endpoint returned ${code:-no response}" >&2; exit 1; }
  echo "PASS: /$endpoint HTTP 200"
done
