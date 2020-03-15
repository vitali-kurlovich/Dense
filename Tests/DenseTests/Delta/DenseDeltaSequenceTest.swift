//
//  DenseDeltaSequenceTest.swift
//  DenseTests
//
//  Created by Vitali Kurlovich on 3/16/20.
//

@testable import Dense
import XCTest

class DenseDeltaSequenceTest: XCTestCase {
    func testDenseDeltaSequence() {
        let source = [6, 7, 8, 2, -2, 0, -5, -5]

        let sequence = DeltaSequence(source)

        XCTAssertEqual(sequence.first, 6)

        let delta = Array(sequence)
        XCTAssertEqual(delta, [1, 1, -6, -4, 2, -5, 0])
    }
}
