SHELL := /usr/bin/env bash
.PHONY: validate preflight deploy dry-run verify rollback uninstall
validate:
	./scripts/validate.sh
preflight:
	./scripts/preflight.sh
deploy:
	./scripts/deploy-compose.sh
dry-run:
	./scripts/deploy-compose.sh --dry-run
verify:
	./scripts/verify-deployment.sh
rollback:
	./scripts/rollback-compose.sh
uninstall:
	./scripts/uninstall-compose.sh
