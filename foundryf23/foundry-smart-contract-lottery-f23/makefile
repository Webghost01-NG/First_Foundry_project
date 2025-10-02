-include .env

.PHONY: all build test coverage clean

build:
	forge build	
test:
	forge test --fork-url ${RPC_URL} --gas-report --ffi
coverage:
	forge coverage --fork-url ${RPC_URL} --report lcov
clean:				
	forge clean
	rm -rf coverage.txt lcov.info coverage/	
		