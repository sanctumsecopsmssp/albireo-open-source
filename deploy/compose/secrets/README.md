# Runtime secrets

This directory is mounted read-only at `/run/secrets/albireo`. Keep only runtime-injected files here and never commit them. Expected files are `node.key`, `peers.bundle`, and, only when anchoring is enabled, `rpc.token`. Files should be owned by the deployment operator, readable by runtime UID 65532 through an approved mechanism, and not world-readable.
