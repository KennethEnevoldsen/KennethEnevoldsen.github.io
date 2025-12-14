serve-docs:
	rm -rf ./site
	rm -rf ./.cache
	uv run zensical serve

build-docs:
	uv run zensical build