import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(MemoryBufferTest.allTests),
            testCase(DenseArrayTests.allTests),
            testCase(InternalDenseArrayTests.allTests),
            testCase(DenseSequenceTest.allTests),
            testCase(SequenceInfoTest.allTests),
            testCase(DeltaSequenceIteratorTest.allTests),
        ]
    }
#endif
