#!/usr/bin/env bash

if [[ ${RUN_PHPCS} == 1 ]] || [[ ${RUN_E2E} == 1 ]]; then
	exit
fi

if [[ ${RUN_CODE_COVERAGE} == 1 ]]; then
	phpdbg -qrr -d memory_limit=-1 $HOME/.composer/vendor/bin/phpunit -c phpunit.xml --coverage-clover=coverage.clover --exclude-group=timeout
else
	phpunit -c phpunit.xml
fi
