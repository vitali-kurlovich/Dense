//
//  DeltaSequenceTest.swift
//  DenseTests
//
//  Created by Vitali Kurlovich on 3/16/20.
//

@testable import Dense
import XCTest

class DeltaSequenceTest: XCTestCase {
    func testDeltaSequence() {
        let source = [6, 7, 8, 2, -2, 0, -5, -5]
        let delta = DeltaSequence(source)

        let result = Array(delta)
        XCTAssertEqual(result, [1, 1, -6, -4, 2, -5, 0])
    }
}
