.DEFAULT_GOAL := help

REGISTRY := "ghcr.io"
REPO := "mego22"
VERSION := $(shell git log -n1 --format=format:"%H" | cut -c -7)
LATEST := "true"

check_defined = \
				$(strip $(foreach 1,$1, \
				$(call __check_defined,$1,$(strip $(value 2)))))
__check_defined = \
				  $(if $(value $1),, \
				  $(error Undefined $1$(if $2, ($2))$(if $(value @), \
				  required by target `$@')))

.PHONY: build
build: ## Build an image (DIR=utility)
	@:$(call check_defined, DIR, directory of the Dockefile)
	@cd ${DIR} && docker build --rm --force-rm -t ${REPO}/${DIR}:${VERSION} .
	@if [ "${LATEST}" = "true" ]; then \
		docker tag ${REPO}/${DIR}:${VERSION} ${REPO}/${DIR}:latest; \
	fi

.PHONY: git_build
gha_build: ## Used with Github Actions to build the images that where added or modified on a merge to master
	@$(CURDIR)/git-build.sh

.PHONY: lint_dockerfile
lint_dockerfile: ## Lint your Dockerfiles (DIR=utility)
	@docker run --rm -i hadolint/hadolint < ${DIR}/Dockerfile

.PHONY: push
push: ## Push images to registry (IMAGE=utility)
	@:$(call check_defined, IMAGE, Image to push)
	@docker push ${REPO}/${IMAGE}:${VERSION}
	@if [ "${LATEST}" = "true" ]; then \
		docker push ${REPO}/${IMAGE}:latest; \
	fi


.PHONY: test
test: ## Run tests on the repo

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
