# Albireo Open-Source Launch

Albireo is the open protocol and reference implementation boundary for an identity-aware encrypted overlay designed to produce independently verifiable evidence about authenticated sessions and policy decisions.

This public repository contains launch policy and a security-first deployment framework. It does **not** yet contain a reviewed production implementation or published OCI image. No private keys, customer data, CUI, internal topology, or production configuration belong here.

## Planned public scope

- Protocol and wire format.
- Core node, CLI, SDKs, and local verifier.
- Evidence schema, conformance tests, and test vectors.
- Formal models and reproducibility artifacts.
- Minimal deployment examples using synthetic configuration.

## Deployment

Deployment assets are under `deploy/`, `config/`, and `scripts/`. Start with [Deployment](docs/DEPLOYMENT.md), [Image Contract](docs/IMAGE-CONTRACT.md), and [Configuration](docs/CONFIGURATION.md). They intentionally fail closed until a reviewed image digest and operator-supplied secrets are provided.

```bash
cp deploy/compose/.env.example deploy/compose/.env
cp config/albireo.example.yaml config/albireo.yaml
make preflight
```

## Commercial boundary

Sanctum SecOps may offer managed evidence verification, blockchain anchoring, retention, policy orchestration, enterprise connectors, dedicated validators, support, training, and regulated deployments. The open-source implementation will not require the hosted service. See `COMMERCIAL-BOUNDARY.md`.

## Status

Experimental planning and deployment-contract repository. Do not infer production readiness, certification, FIPS validation, standards approval, regulatory compliance, or fitness for a particular environment.

## License

Code is Apache-2.0 unless a file says otherwise. Specification prose may be released separately under CC BY 4.0 after counsel and provenance review. Trademarks are not licensed.
