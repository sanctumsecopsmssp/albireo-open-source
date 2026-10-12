# Albireo Open-Source Launch

Albireo is the open protocol and reference implementation boundary for an identity-aware encrypted overlay designed to produce independently verifiable evidence about authenticated sessions and policy decisions.

This public repository contains launch policy and a security-first deployment framework. It does **not** yet contain a reviewed production implementation or published OCI image. No private keys, customer data, CUI, internal topology, or production configuration belong here.

## Planned public scope (decision 2026-10-11: specification only)

- The ALBIREO protocol specification and wire-format description, published
  under CC BY 4.0 **only after** the related patent filing and a recorded
  pre-disclosure clearance.
- Minimal deployment examples using synthetic configuration (already in this
  repository).

The core node, CLI, SDKs, local verifier, conformance suite, test vectors,
formal models, and reproducibility artifacts are **proprietary to Sanctum
SecOps LLC** and are not published or licensed by this repository.

## Deployment

Deployment assets are under `deploy/`, `config/`, and `scripts/`. Start with [Deployment](docs/DEPLOYMENT.md), [Image Contract](docs/IMAGE-CONTRACT.md), and [Configuration](docs/CONFIGURATION.md). They intentionally fail closed until a reviewed image digest and operator-supplied secrets are provided.

```bash
cp deploy/compose/.env.example deploy/compose/.env
cp config/albireo.example.yaml config/albireo.yaml
make preflight
```

## Commercial boundary

Sanctum SecOps may offer managed evidence verification, blockchain anchoring, retention, policy orchestration, enterprise connectors, dedicated validators, support, training, and regulated deployments. Independent implementations of the published specification will not require the hosted service. See `COMMERCIAL-BOUNDARY.md`.

## Status

Experimental planning and deployment-contract repository. Do not infer production readiness, certification, FIPS validation, standards approval, regulatory compliance, or fitness for a particular environment.

## License

- Files currently in this repository (deployment scaffolding, scripts, and
  docs) are Apache-2.0 unless a file says otherwise.
- The ALBIREO specification, when published, will be CC BY 4.0. Under CC BY 4.0
  Section 2(b)(2), that license grants no patent or trademark rights.
- The ALBIREO core node, CLI, SDKs, verifier, conformance suite, test vectors,
  and formal models are proprietary to Sanctum SecOps LLC. Patent pending.
- Trademarks are not licensed.
