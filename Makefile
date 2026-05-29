#!/bin/make -f
SHELL=/bin/sh

DC = docker compose
DC_CLI = $(DC) run --rm cli

.PHONY: init
init: dist/master-password.min.js

dist/master-password.min.js: node_modules
	$(DC_CLI) run build

node_modules:
	$(DC_CLI) install