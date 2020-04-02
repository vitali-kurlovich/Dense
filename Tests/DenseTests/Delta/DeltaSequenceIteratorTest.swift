//
//  SequenceDelataIteratorTest.swift
//  DenseTests
//
//  Created by Vitali Kurlovich on 3/15/20.
//

@testable import Dense
import XCTest

final class DeltaSequenceIteratorTest: XCTestCase {
    func testIterator() {
        let source = [6, 7, 8, 2, -2, 0, -5, -5]

        let delta = DeltaSequence(source).map { $0 }

        XCTAssertEqual(delta, [6, 1, 1, -6, -4, 2, -5, 0])

        let accumulated = AccumulateSequence(delta).map { $0 }

        XCTAssertEqual(source, accumulated)
    }

    func testIterator_1() {
        let source = [6]

        let delta = DeltaSequence(source).map { $0 }

        XCTAssertEqual(delta, [6])

        let accumulated = AccumulateSequence(delta).map { $0 }

        XCTAssertEqual(source, accumulated)
    }

    func testIterator_2() {
        let source: [Int] = []

        let delta = DeltaSequence(source).map { $0 }

        XCTAssertEqual(delta, [])

        let accumulated = AccumulateSequence(delta).map { $0 }

        XCTAssertEqual(source, accumulated)
    }

    static var allTests = [
        ("testIterator", testIterator),
        ("testIterator_1", testIterator_1),
        ("testIterator_2", testIterator_2),
    ]
}
