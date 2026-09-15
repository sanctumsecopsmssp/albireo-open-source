#!/usr/bin/env bash
set -Eeuo pipefail
type=${1:-}
case $type in
  standalone|responder|gateway-tun)
    echo "docker compose --env-file deploy/compose/.env -f deploy/compose/compose.yaml -f deploy/types/$type/compose.override.yaml config"
    ;;
  airgap-verifier|anchor-worker)
    echo "docker compose --env-file deploy/compose/.env -f deploy/types/$type/compose.yaml config"
    ;;
  ha-verifier)
    echo "kubectl kustomize deploy/types/ha-verifier"
    ;;
  *)
    echo "usage: $0 {standalone|responder|gateway-tun|airgap-verifier|anchor-worker|ha-verifier}" >&2
    exit 2
    ;;
esac
