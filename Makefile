NODE_ENV ?= development
out := build.$(NODE_ENV)

.PHONY: compile
compile:

# in a development build we build angular bundle straint from
# `angular.js` file. in a production build we add a runtime
# instructions that tell angular switch to its 'production' mode.
ng.src := angular.js
ng.src.prod := angular.production.js
ng.dest := $(out)/angular.browserify.js

# in a production build we need to minify the angular bundle, thus
# we make a bundle w/ .es5 extension which is later on is minified by
# uglifyjs into a usual .js.
ng.dest.inter := $(ng.dest)
ifeq ($(NODE_ENV), production)
ng.dest.inter := $(addsuffix .es5, $(basename $(ng.dest)))
.INTERMEDIATE: $(ng.dest.inter)
endif

ifeq ($(NODE_ENV), production)
ng.src_orig := $(ng.src)
ng.src := $(out)/$(ng.src.prod)
.INTERMEDIATE: $(ng.src)

$(ng.src): $(ng.src_orig) $(ng.src.prod)
	@mkdir -p $(dir $@)
	cat $^ > $@
endif

$(ng.dest.inter): $(ng.src)
	@mkdir -p $(dir $@)
	node_modules/.bin/browserify $< --standalone ng -o $@

# remove -m CLO if you have troubles w/ the minified version
%.js: %.es5
	node_modules/.bin/uglifyjs --screw-ie8 -m -c -o $@ -- $<

.PHONY: copy
copy:
	@mkdir -p $(out)
	@cp my-app.js index.html package.json $(out)


compile: $(ng.dest) copy

.DELETE_ON_ERROR:
pp-%:
	@echo "$(strip $($*))" | tr ' ' \\n
