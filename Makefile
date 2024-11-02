current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SHELL = /bin/bash

ifneq (,$(findstring xterm,${TERM}))
	BLACK        := $(shell tput -Txterm setaf 0)
	RED          := $(shell tput -Txterm setaf 1)
	GREEN        := $(shell tput -Txterm setaf 2)
	YELLOW       := $(shell tput -Txterm setaf 3)
	LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
	PURPLE       := $(shell tput -Txterm setaf 5)
	BLUE         := $(shell tput -Txterm setaf 6)
	WHITE        := $(shell tput -Txterm setaf 7)
	RESET        := $(shell tput -Txterm sgr0)
else
	BLACK        := ""
	RED          := ""
	GREEN        := ""
	YELLOW       := ""
	LIGHTPURPLE  := ""
	PURPLE       := ""
	BLUE         := ""
	WHITE        := ""
	RESET        := ""
endif

help:
	@grep -E '^[a-zA-Z_0-9%-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "${GREEN}%-12s${RESET} %s\n", $$1, $$2}'

default: server

bootstrap: ## is used solely for fulfilling dependencies of the project
	@./scripts.d/bootstrap.sh

setup: bootstrap ## is used to set up a project in an initial state
	@./scripts.d/setup.sh

update: ## is used to update the project after a fresh pull
	@echo "is used to update the project after a fresh pull"

server: setup ## is used to start the application
	@./scripts.d/server.sh

server-no-docker: setup ## is used to start the application
	@./scripts.d/server-no-docker.sh

down: ## is used to run the test suite of the application
	@./scripts.d/compose-down.sh

test: ## is used to run the test suite of the application
	@echo "is used to run the test suite of the application"

cibuild: ## is used for your continuous integration server
	@echo "is used for your continuous integration server"

console: ## is used to open a console for your application
	@echo "is used to open a console for your application"

clean: ## is used to reset the infrastructure o an inditial state
	@echo "is used to reset the infrastructure o an inditial state"
