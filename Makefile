SHELL := /usr/bin/env bash
.PHONY: validate preflight deploy dry-run verify rollback uninstall types type
validate:
	bash ./scripts/validate.sh
preflight:
	bash ./scripts/preflight.sh
deploy:
	bash ./scripts/deploy-compose.sh
dry-run:
	bash ./scripts/deploy-compose.sh --dry-run
verify:
	bash ./scripts/verify-deployment.sh
rollback:
	bash ./scripts/rollback-compose.sh
uninstall:
	bash ./scripts/uninstall-compose.sh
types:
	@echo standalone responder gateway-tun airgap-verifier anchor-worker ha-verifier
type:
	@bash ./scripts/deployment-type.sh "$(TYPE)"
