.DEFAULT_GOAL := help

REGISTRY := docker.pkg.github.com
OWNER := mego22

.PHONY: build
build: ## Build an image (DIR=utility)
	@cd ${DIR} && docker build --rm --force-rm -t ${REPO}/${DIR}:latest -t $(REGISTRY)/${REPO}/${DIR}:latest .

.PHONY: git_build
gha_build: ## Used with Github Actions to build the images that where added or modified on a merge to master
	@$(CURDIR)/git-build.sh

.PHONY: lint_dockerfile
lint_dockerfile: ## Lint your Dockerfiles (DIR=utility)
	@docker run --rm -i hadolint/hadolint < ${DIR}/Dockerfile

.PHONY: push
push: ## Push images to registry (IMAGE=utility)
	@docker push $(REGISTRY)/${REPO}/${IMAGE}:latest

.PHONY: test
test: ## Run tests on the repo

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
