#!/usr/bin/env bash
set -Eeuo pipefail
ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
find "$ROOT/scripts" -type f -name '*.sh' -print0 | xargs -0 -n1 bash -n
python3 -m json.tool "$ROOT/config/albireo.schema.json" >/dev/null
python3 -m json.tool "$ROOT/deploy/helm/albireo/values.schema.json" >/dev/null
! grep -RIE '(BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY|gh[pousr]_[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16})' "$ROOT/deploy" "$ROOT/config"
grep -q 'read_only: true' "$ROOT/deploy/compose/compose.yaml"
grep -q 'cap_drop' "$ROOT/deploy/compose/compose.yaml"
grep -q 'runAsNonRoot: true' "$ROOT/deploy/kubernetes/all.yaml"
grep -q 'readOnlyRootFilesystem: true' "$ROOT/deploy/kubernetes/all.yaml"
if command -v helm >/dev/null; then helm lint "$ROOT/deploy/helm/albireo" --set image.repository=registry.example.invalid/albireo --set image.digest=sha256:1111111111111111111111111111111111111111111111111111111111111111 --set secrets.existingSecret=albireo-test; fi
echo "PASS: static deployment validation"
