.PHONY: help

help: ## Print this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Build a dockerimage
	docker build --tag python-docker .

run:
	docker run -it --rm --name python-docker -p 8080:8080 python-docker

shell: ## shell inside docker container
	docker run -it --rm --name python-docker python-docker /bin/bash

login: ## login to docker hub
	docker login

push: ## push docker image to docker hub
	docker tag python-docker:latest josefigueredo/python-docker:latest
	docker push josefigueredo/python-docker:latest
