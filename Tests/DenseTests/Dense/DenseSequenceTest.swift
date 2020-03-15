//
//  DenseSequenceTest.swift
//  DenseTests
//
//  Created by Vitali Kurlovich on 3/16/20.
//

@testable import Dense
import XCTest

class DenseSequenceTest: XCTestCase {
    func testDenseSequence() {
        let array: [Int] = [5, 6, 7, 45, 2, 63, 13, 54, 66, 44, 33, 164, 321, 54, 123]

        let compact = DenseSequence(array)

        XCTAssertEqual(array, Array(compact))
    }
}
