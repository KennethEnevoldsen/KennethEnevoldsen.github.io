serve-docs:
	rm -rf ./site
	rm -rf ./.cache
	uv run zensical serve

build-docs:
	rm -rf ./site
	rm -rf ./.cache
	uv run zensical build --clean
	open ./site/index.html