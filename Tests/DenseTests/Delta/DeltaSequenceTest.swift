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

    func testDeltaSequence_1() {
        let source: [Int] = [5, 6, 7, 45, 2, 63, 13, 54, 66, 44, 33, 164, 321, 54, 123]

        let delta = DeltaSequence(source)

        let result = Array(delta)

        XCTAssertEqual(result, [1, 1, 38, -43, 61, 13 - 63, 54 - 13, 12, -22, 33 - 44, 164 - 33, 321 - 164, 54 - 321, 123 - 54])
    }
}
