# This make file will be used for terraform
.PHONY: build up down
.DEFAULT_GOAL := help

##@ Commands
.PHONY: help
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make <command>\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

build:  ## Build neovim docker image
	cd alpine && \
	docker build -t lilmonk/neovim:latest .

up:  ## Run docker compose up
	docker compose up -d

down:  ## Run docker compose down
	docker compose down