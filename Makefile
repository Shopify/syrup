PLATFORM := $(shell uname -s)

CONFIGURATION = debug
BUILD_PATH = `swift build --configuration $(CONFIGURATION) --show-bin-path`
ROOT_DIR = $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

debug: build

release: CONFIGURATION = release
release: clean build
	
build:
	swift build --configuration $(CONFIGURATION)
	
test:
	swift test
	swiftc -suppress-warnings $(shell find $(ROOT_DIR)/Tests/Resources/CompilationSupport $(ROOT_DIR)/Tests/Resources/ExpectedSwiftCode -name "*.swift")

test-docker-linux:
	docker build -t syrup-linux .
	docker run syrup-linux make test

record: CONFIGURATION = debug
record: build
record:
	rm -rf $(ROOT_DIR)/Tests/Resources/ExpectedSwiftCode/*
	rm -rf $(ROOT_DIR)/Tests/Resources/ExpectedKotlinCode/*
	RECORD=true swift test
	
xcode:
	swift package generate-xcodeproj

clean:
	swift package clean
	
.PHONY: debug release build test test-docker-linux record xcode clean
