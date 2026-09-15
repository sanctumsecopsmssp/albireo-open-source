# Deployment Type Profiles

Profiles extend the secure baseline and use synthetic values. Replace the image with an approved immutable digest and inject secrets outside Git.

- `standalone`: one local node with loopback health and peer UDP bound to a selected address.
- `responder`: listener-only node; outbound initiation is disabled by the image mode contract.
- `gateway-tun`: opt-in Linux TUN profile with only `NET_ADMIN` and `/dev/net/tun`.
- `airgap-verifier`: network-disabled offline verifier.
- `anchor-worker`: separate outbound-only commitment anchoring worker.
- `ha-verifier`: stateless verifier API with anti-affinity, disruption budget, and default-deny networking.

Example:

```bash
docker compose --env-file deploy/compose/.env -f deploy/compose/compose.yaml -f deploy/types/responder/compose.override.yaml config
```

Do not combine incompatible profiles. Gateway TUN is for dedicated Linux hosts and is not part of the restricted Kubernetes baseline.
