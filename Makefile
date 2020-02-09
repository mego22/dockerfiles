GIT_SHA1 = $(shell git rev-parse --verify HEAD | cut -c -10)
CONTAINERS = $(shell find . -type f -iname 'Dockerfile' | cut -d\/ -f2)

.PHONY: all gh ${CONTAINERS}

all: ${CONTAINERS}

${CONTAINERS}: 
	$(eval CONTAINER := $@ )
	@echo "docker build --file ${CONTAINER}/Dockerfile"

gh:
	CONTAINERS_TO_BUILD = $(shell git diff --name-only HEAD HEAD~1 | sort | cut -d\/ -f1 | uniq)
	for CONTAINER in $(CONTAINERS_TO_BUILD); do \
		if [ ${CONTAINER}/Dockerfile ]; then ${CONTAINER}; fi \
	done
