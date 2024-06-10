.PHONY: help run add add-dev remove remove-dev gen
.DEFAULT_GOAL := help

run:
	fvm flutter run

add:
ifndef lib
	$(error lib is not set)
endif
	fvm flutter pub add $(lib)

add-dev:
ifndef lib
	$(error lib is not set)
endif
	fvm flutter pub add --dev $(lib)

remove:
ifndef lib
	$(error lib is not set)
endif
	fvm flutter pub remove $(lib)

remove-dev:
ifndef lib
	$(error lib is not set)
endif
	fvm flutter pub remove --dev $(lib)

gen:
	make openapi
	dart run swagger_parser
	fvm flutter pub run build_runner build --delete-conflicting-outputs

openapi: ## Generate openapi
	curl http://127.0.0.1:8000/openapi.json -o openapi.json