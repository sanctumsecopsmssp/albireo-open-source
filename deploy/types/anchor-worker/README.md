# Anchor Worker

Run anchoring separately from nodes and verifiers. Inject RPC credentials as `secrets/rpc.token`; never place an API key in the config URL. Permit egress only to approved DNS, time, and RPC destinations using host or orchestrator policy. Queue limits and confirmation policy are mandatory. Raw evidence must never enter this worker.
