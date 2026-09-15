# OCI Image Contract

This is a release contract, not a claim that an image currently implements it.

- Image runs as UID/GID 65532 by default and requires no root filesystem writes.
- Entrypoint accepts `serve --config /etc/albireo/albireo.yaml`; `version`; and `healthcheck --url <url>`.
- Configuration is read from `/etc/albireo/albireo.yaml`; secrets are referenced by file path under `/run/secrets/albireo`.
- Persistent state is confined to `/var/lib/albireo`; temporary files use `/tmp`.
- UDP peer transport defaults to port 9500/udp. Health and readiness HTTP default to 8080/tcp and bind to loopback or the pod interface according to deployment. Metrics default disabled.
- `GET /health` reports process liveness only. `GET /ready` returns 200 only when mandatory identity, policy, state, and required dependencies are usable; otherwise it returns a non-2xx status with no secret material.
- Logs use structured stdout/stderr, UTC timestamps, stable event identifiers, and no keys, tokens, raw evidence, personal data, or reversible tenant identifiers.
- SIGTERM stops new work, drains bounded in-flight work, persists required state, and exits before the orchestrator grace period. Exit 0 means clean stop; nonzero means failure.
- `albireo version` prints semantic version, commit, build time, protocol version, and enabled feature names without secret values.
- Public-chain support submits only approved commitments. RPC failure must queue or reject safely, never downgrade verification or expose raw evidence.
- The baseline image requires no privileged mode, host namespaces, Docker socket, host networking, or Linux capabilities. TUN mode is outside this baseline and requires a separately reviewed package.
