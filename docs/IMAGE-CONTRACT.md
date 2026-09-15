# OCI Image Contract

This is a release contract, not a claim that an image currently implements it.

## Common contract

- Image runs as UID/GID 65532 by default and requires no root filesystem writes.
- Configuration is read from `/etc/albireo/albireo.yaml`; secrets are referenced by file path under `/run/secrets/albireo`.
- Persistent state is confined to `/var/lib/albireo`; temporary files use `/tmp`.
- `GET /health` reports process liveness only. `GET /ready` returns 200 only when mandatory identity, policy, state, and required dependencies are usable.
- Logs use structured stdout/stderr, UTC timestamps, stable event identifiers, and contain no keys, tokens, raw evidence, personal data, CUI, or reversible tenant identifiers.
- SIGTERM stops new work, drains bounded in-flight work, persists required state, and exits before the orchestrator grace period.
- `albireo version` prints semantic version, commit, build time, protocol version, and enabled features without secret values.

## Runtime commands

- `serve --mode standalone|responder|gateway --config PATH` runs a node. Responder mode must not initiate peer sessions. Gateway mode must fail closed when TUN setup, route policy, or identity checks fail.
- `verify --input DIR --output DIR --trust-bundle FILE` performs offline verification and must require no network.
- `verifier-api --config PATH` runs a stateless verification API without node private keys.
- `anchor-worker --config PATH` consumes only approved commitments from a bounded durable queue and submits them to configured RPC endpoints.
- `healthcheck --url URL` returns nonzero unless the selected endpoint returns an accepted status.

## Ports and privileges

UDP peer transport defaults to 9500/udp. Health/readiness default to 8080/tcp. Metrics default disabled. Standalone and responder require no capabilities. The TUN gateway is the only profile permitted to request `NET_ADMIN` and `/dev/net/tun`; it must not use privileged mode, host PID, host IPC, the Docker socket, or unrestricted host networking.

## Blockchain boundary

Only approved commitments may leave through the anchor worker. RPC failure must queue or reject safely and must never downgrade verification, drop required evidence without an explicit error, or expose raw evidence.
