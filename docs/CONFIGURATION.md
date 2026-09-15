# Configuration

Configuration uses YAML validated by `config/albireo.schema.json`. Environment variables select the image and non-secret deployment ports only. Identity keys, peer trust, and RPC credentials must be mounted files or secret-provider references, never command-line values.

| Field | Purpose | Safe default |
|---|---|---|
| `node.id` | Public opaque node identifier | Required |
| `listen.udp` | UDP bind address | `0.0.0.0:9500` |
| `listen.health` | Health bind address | `0.0.0.0:8080` in containers |
| `identity.private_key_file` | Node private key path | Required |
| `identity.peer_bundle_file` | Approved peer trust bundle | Required |
| `storage.path` | Persistent state | `/var/lib/albireo` |
| `anchoring.enabled` | Optional commitment anchoring | `false` |
| `anchoring.rpc_credential_file` | RPC credential path | Empty |
| `telemetry.metrics_enabled` | Metrics endpoint | `false` |

Never log secret file contents. Refuse world-readable secret files. Refuse anchoring when enabled without a credential file, approved chain identifier, confirmation policy, and queue limit.
