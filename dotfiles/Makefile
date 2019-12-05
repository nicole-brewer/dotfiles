# get Makefile path reguardless of cwd
MKFILE_PATH:= $(abspath $(lastword $(MAKEFILE_LIST)))

.PHONY: test_path

all: test_path

test_path:
	@echo "${MKFILE_PATH}"


