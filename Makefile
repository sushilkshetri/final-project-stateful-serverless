# One command per step. Each target is a placeholder for now.

.PHONY: help test deploy-stateful deploy-stateless seed run check teardown

help:
	@echo "make test                              unit tests for shared rules"
	@echo "make deploy-stateful                   deploy the stateful side (Lambda + owner node)"
	@echo "make deploy-stateless                  deploy the baseline (Lambda + DynamoDB)"
	@echo "make seed                              fresh events, rooms, counters"
	@echo "make run EXP=<config> TARGET=<side>    run one experiment (TARGET=stateful or stateless)"
	@echo "make check EXP=<config> TARGET=<side>  correctness check after a run"
	@echo "make teardown                          remove AWS resources"

test:
	@echo "TODO: run unit tests"

deploy-stateful:
	./scripts/deploy-stateful.sh

deploy-stateless:
	./scripts/deploy-stateless.sh

seed:
	@echo "TODO: run scripts/seed.ts"

run:
	./experiments/scripts/run.sh $(EXP) $(TARGET)

check:
	@echo "TODO: run experiments/scripts/check_correctness.ts $(EXP) $(TARGET)"

teardown:
	./scripts/teardown.sh
