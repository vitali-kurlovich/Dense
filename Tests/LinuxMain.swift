import XCTest

import DenseTests

var tests = [XCTestCaseEntry]()
tests += DenseArrayTests.allTests()
XCTMain(tests)
