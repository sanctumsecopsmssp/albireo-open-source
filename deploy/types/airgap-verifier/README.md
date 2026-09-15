# Air-Gapped Verifier

Create `input`, `trust`, and `output` outside source control. Place only exported evidence in `input` and approved public trust material at `trust/trust.bundle`. The container has no network namespace connectivity. Results are written to `output`. Never provide node private keys.
