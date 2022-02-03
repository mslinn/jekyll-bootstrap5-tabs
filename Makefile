default: install

all: install build


h help:
	@grep '^[a-z]' Makefile


install:
	bundle config set --local path vendor/bundle/
	bundle install

upgrade:
	bundle update

.ONESHELL:
s serve:
  # Botched attempt
	@#@export RUBY_VERSION=` gem env | grep 'RUBY VERSION' | cut -d' ' -f 6 | sed "s/\([0-9]\)\s*$/0/" `
	@#@sed '^vendor/bundle/ruby^s^2.7.0^$$RUBY_VERSION^' _config.yml
	mkdir -p assets/js
	@cp vendor/bundle/ruby/2.7.0/gems/bootstrap-5.1.3/assets/javascripts/bootstrap.min.js assets/js/bootstrap.min.js
	@cp vendor/bundle/ruby/2.7.0/gems/popper_js-2.9.3/assets/javascripts/popper.js assets/js/popper.js
	bundle exec jekyll serve --trace --livereload --no-watch

build:
	JEKYLL_ENV=production bundle exec jekyll build --trace
