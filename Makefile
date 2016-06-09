NODE_ENV ?= development
out := build.$(NODE_ENV)

.PHONY: compile
compile:

ng.dest := $(out)/angular.browserify.js
include ng.mk

.PHONY: copy
copy:
	@mkdir -p $(out)
	@cp *.js *.json $(out)
	@cp example.html $(out)/index.html

compile: $(ng.dest) copy


.PHONY: server
server:
	ruby -run -ehttpd . -p8000

.DELETE_ON_ERROR:
pp-%:
	@echo "$(strip $($*))" | tr ' ' \\n
