# Governance

Maintainers approve code and releases. Specification editors manage protocol text and registries. Security reviewers may block releases for unresolved high-risk findings. The hosted-service team cannot unilaterally weaken the public protocol.

Routine changes use public review and lazy consensus. Wire-format, cryptographic-suite, security-boundary, and governance changes require a recorded proposal and two maintainer approvals, including one security reviewer.

Stable identifiers are not silently reused. Deprecated algorithms and fields remain documented. Implementations should fail closed when a mandatory authentication or policy check cannot complete. Governance decisions and exceptions must be recorded.
