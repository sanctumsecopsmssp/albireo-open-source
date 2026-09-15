# Deployment

## Release status

These assets define a deployable contract but cannot start Albireo until a reviewed OCI image implementing `IMAGE-CONTRACT.md` is published. Always deploy an immutable image digest. Never substitute `latest`.

## Prerequisites

- Linux host or Kubernetes cluster with synchronized time and working DNS.
- Docker Engine with Compose v2, or Kubernetes 1.28+ with Helm 3.
- A reviewed image reference such as `registry.example.invalid/albireo@sha256:<64 hex>`.
- Node identity, peer trust material, and optional RPC credentials delivered as files by an approved secret manager.
- Explicitly approved ingress, egress, retention, backup, and log destinations.

The scripts report missing firewall, routing, kernel, or package requirements but never change them automatically.

## Compose

```bash
cp deploy/compose/.env.example deploy/compose/.env
cp config/albireo.example.yaml config/albireo.yaml
install -d -m 0700 deploy/compose/secrets
# Secret manager writes files into deploy/compose/secrets; do not commit them.
make preflight
make deploy
make verify
```

## Helm

```bash
helm lint deploy/helm/albireo --set image.repository=registry.example.invalid/albireo --set image.digest=sha256:<64-hex>
helm upgrade --install albireo deploy/helm/albireo --namespace albireo --create-namespace --set image.repository=registry.example.invalid/albireo --set image.digest=sha256:<64-hex> --set secrets.existingSecret=albireo-identity
```

Create the referenced Secret out of band. Do not commit rendered Secret manifests. Default NetworkPolicy denies ingress and non-DNS egress; operators must add reviewed peer and optional RPC egress rules.

## Plain Kubernetes

Copy `deploy/kubernetes/secret-example.yaml` outside the repository, replace placeholders through a secret-management workflow, apply it, then apply the kustomization. Replace the non-pullable image with an approved digest first.

## systemd

Install the binary at `/usr/local/bin/albireo`, create the locked system account, place configuration under `/etc/albireo`, secrets under `/etc/albireo/secrets` mode 0600, state under `/var/lib/albireo`, and install `deploy/systemd/albireo.service`. TUN operation is not enabled by this baseline because it requires additional host privileges and a separate threat review.

## Upgrade and rollback

Record the current digest, verify signatures/SBOM/provenance, update only the digest, deploy, and verify readiness plus peer behavior. For Compose set `PREVIOUS_ALBIREO_IMAGE` and run `make rollback`. Kubernetes operators should use Helm revision rollback after confirming the previous digest remains approved.

## Uninstall

`make uninstall` requires explicit confirmation and preserves data. Purging state requires `PURGE_DATA=yes` and a separate backup decision.
