serve-docs:
	rm -rf ./site
	rm -rf ./.cache
	zensical serve

build-docs:
	zensical build