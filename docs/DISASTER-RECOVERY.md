# Disaster Recovery

Back up encrypted persistent state, approved public trust bundles, policy, non-secret configuration, receipt indexes, and evidence required by contract. Private keys should be recovered through the approved HSM or secret system rather than ordinary file backup when possible. Never back up transient RPC tokens into repository or log storage.

Define RPO/RTO per customer tier. Test restore into an isolated environment at least quarterly, verify artifact digests and signatures, restore state, inject identity through the secret system, confirm readiness, verify historical receipts, and test peer re-enrollment.

A rollback restores the prior approved image digest and compatible configuration. Do not roll back across an irreversible state-schema change without an approved migration plan. Public-chain records are not backups of raw evidence and cannot generally be deleted.
