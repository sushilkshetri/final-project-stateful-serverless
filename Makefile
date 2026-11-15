# One command per step. Most targets are placeholders for now.

.PHONY: help test build deploy-stateful deploy-stateless seed run check teardown

help:
	@echo "make test                              go test ./..."
	@echo "make build                             build the Lambdas and the owner node"
	@echo "make deploy-stateful                   deploy the stateful side (Lambda + owner node)"
	@echo "make deploy-stateless                  deploy the baseline (Lambda + DynamoDB)"
	@echo "make seed                              fresh events, rooms, counters"
	@echo "make run EXP=<config> TARGET=<side>    run one experiment (TARGET=stateful or stateless)"
	@echo "make check EXP=<config> TARGET=<side>  correctness check after a run"
	@echo "make teardown                          remove AWS resources"

test:
	go test ./...

build:
	@echo "TODO: build each cmd/*-fn as a Lambda bootstrap binary, and the owner node image"

deploy-stateful:
	./scripts/deploy-stateful.sh

deploy-stateless:
	./scripts/deploy-stateless.sh

seed:
	go run ./scripts/seed

run:
	./experiments/scripts/run.sh $(EXP) $(TARGET)

check:
	go run ./experiments/scripts/check $(EXP) $(TARGET)

teardown:
	./scripts/teardown.sh
