import XCTest

import SyrupTests

var tests = [XCTestCaseEntry]()
tests += SyrupTests.__allTests()

XCTMain(tests)
