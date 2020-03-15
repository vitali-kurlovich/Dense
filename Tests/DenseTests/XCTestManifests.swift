import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(DenseArrayTests.allTests),
        ]
    }
#endif
