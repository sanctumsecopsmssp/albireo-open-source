# Release and Supply Chain

The following controls are requirements, not claims of current operation.

- Build from a reviewed, tagged commit in an isolated CI job with least privilege.
- Produce a CycloneDX or SPDX SBOM, provenance attestation, vulnerability report, image digest, and artifact hash manifest.
- Sign the image digest and release manifest with an approved keyless or hardware-backed process.
- Publish immutable digests; mutable tags are convenience pointers only. Production deployment requires a digest.
- Block promotion for unresolved critical vulnerabilities and document time-bounded exceptions for lower severities.
- Promote the same digest through experimental, candidate, and stable channels after conformance, interoperability, shutdown, replay, downgrade, loss, recovery, and rollback tests.
- Retain source provenance and third-party license evidence. Do not publish until patent, export, customer-data, CUI, and secret-history reviews pass.
