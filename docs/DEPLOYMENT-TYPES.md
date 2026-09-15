# Deployment Types

Albireo separates deployment topology from protocol behavior. Every type remains experimental until a reviewed image implements the corresponding command and passes the release gate.

| Type | Purpose | Inbound network | Elevated privilege | State model |
|---|---|---|---|---|
| Standalone node | One node for evaluation or a small site | Optional UDP peer port; loopback health | None | One local volume |
| Responder node | Waits for approved peers; does not initiate | UDP peer port | None | One local volume |
| Linux TUN gateway | Routes approved IP traffic through an Albireo interface | UDP peer port | `NET_ADMIN` and `/dev/net/tun` only | Host-bound identity and state |
| Air-gapped verifier | Verifies exported receipts/evidence with no network | None | None | Read-only input; writable result directory |
| Anchor worker | Batches approved commitments and submits them to a configured chain RPC | No published ports; outbound RPC only | None | Durable queue |
| HA verifier API | Horizontally scalable stateless verification API | Internal TCP API/health | None | External or read-only trust data |

## Selection rules

- Use standalone for development and controlled pilots.
- Use responder where inbound initiation is required and outbound peer initiation is prohibited.
- Use TUN gateway only on dedicated Linux hosts after routing, namespace, capability, and shutdown review. Do not run it as a privileged container.
- Use air-gapped verifier for audit packages and disconnected review. It must use copied public trust material, never operational private keys.
- Use anchor worker separately from the node so RPC degradation cannot weaken handshake or evidence verification.
- Scale verifier APIs horizontally only when requests are stateless and trust material is versioned. Never clone one node private identity across active replicas.

## Commands required from the image

- `albireo serve --mode standalone|responder|gateway --config <path>`
- `albireo verify --input <dir> --output <dir> --trust-bundle <path>`
- `albireo verifier-api --config <path>`
- `albireo anchor-worker --config <path>`
- `albireo healthcheck --url <url>`

These commands are release contracts, not claims of current implementation.
