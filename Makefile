.PHONY: fmt test api
fmt:
	black src tests scripts
	isort src tests scripts

test:
	pytest -q

api:
	uvicorn src.api:app --reload
