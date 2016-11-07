shellcheck:
ifeq ($(shell shellcheck > /dev/null 2>&1 ; echo $$?),127)
ifeq ($(shell uname),Darwin)
	@echo brew install shellcheck
else
	@echo sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse'
endif
endif

bats:
@echo bats...

ci-dependencies:
@echo shellcheck bats

lint:
	# these are disabled due to their expansive existence in the codebase. we should clean it up though
	# SC1090: Can't follow non-constant source. Use a directive to specify location.
	# SC2034: Variable appears unused. Verify it or export it.
	# SC2155: Declare and assign separately to avoid masking return values.
	@echo linting...

unit-tests:
	@echo running unit tests...

setup:
	@echo setup ...
	$(MAKE) ci-dependencies

test: setup lint unit-tests
