# Operations

Monitor liveness and readiness separately. Liveness proves the process responds; readiness proves mandatory identity, policy, state, and dependency checks pass. Alert on restart loops, readiness failure, handshake failure rate, replay or authentication drops, queue saturation, state-write errors, time drift, disk pressure, and anchor confirmation age.

Use structured logs with centralized retention and access control. Redact secrets, raw evidence, personal data, CUI, and reversible tenant identifiers. Metrics must use bounded-cardinality opaque labels.

Rotate node identity and peer bundles through overlap windows with explicit activation and rollback. Record public-key fingerprints, approvals, activation time, and revocation. Never overwrite the only recoverable key copy.

When RPC anchoring degrades, preserve verified receipts off-chain, enforce queue limits, expose degraded readiness according to policy, and never send raw evidence to a chain. Incident isolation should block peer/RPC egress, preserve logs and state, revoke affected identity, and produce a timestamped evidence record.
