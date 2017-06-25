SHELL := /bin/bash

CIRCLE_BUILD_NUM?=test
PROJECT_NAME=lambda-template
BUILD_LOCATION=somebucket/somdir
REGION=us-east-1

.PHONY: build
build:
	./package_lambdas.sh

.PHONY: test
test:
	python -m unittest discover -s test -p '**_tests.py'

.PHONY: publish
publish: build
	for i in bin/**.zip; do aws s3 cp $$i "s3://$(BUILD_LOCATION)/$(PROJECT_NAME)/$(CIRCLE_BUILD_NUM)/" --region $(REGION); done


.PHONY: clean
clean:
	rm -rf **.zip
	rm -rf bin
