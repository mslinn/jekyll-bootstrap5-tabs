default: install

all: install build


h help:
	@grep '^[a-z]' Makefile


install:
	bundle config set --local path vendor/bundle/
	bundle install

upgrade:
	bundle update

s serve:
	bundle exec jekyll serve \
		--host 0.0.0.0 --port 4000 \
		--future --incremental --livereload \
		--drafts --unpublished

build:
	JEKYLL_ENV=production bundle exec jekyll build --trace
