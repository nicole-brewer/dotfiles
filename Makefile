# get Makefile path reguardless of cwd
DOT= $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

.PHONY: get_path

all: get_path

get_path:
	echo "export DOT=\"$${DOT%/}\"" > dotfiles_root


