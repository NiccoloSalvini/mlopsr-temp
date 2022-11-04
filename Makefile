SHELL := /bin/bash


# Variables definitions
# -----------------------------------------------------------------------------




# Target section and Global definitions
# -----------------------------------------------------------------------------
.PHONY: build run run_detached test clean generate-requir poetry_version

build:
	docker build --platform linux/amd64 -t model_example

run:
	docker run --env-file ~/.Renviron --rm -p 8000:8000 model_example

run_detached:
	docker run --env-file ~/.Renviron --rm -d -p 8000:8000 model_example


test:


clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -rf `find . -type d -name '*.egg-info' `
	rm -rf `find . -type d -name 'pip-wheel-metadata' `
	rm -rf .cache
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf htmlcov
	rm -rf *.egg-info
	rm -f .coverage
	rm -f .coverage.*
	rm -rf build

export_requir:
	poetry export -f requirements.txt --output requirements.txt --without-hashes

poetry_version:
	poetry version $(version)
