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

        var iterator = DeltaSequenceIterator(source)
        XCTAssertEqual(iterator.first, 6)

        var delta = [Int]()
        delta.reserveCapacity(source.underestimatedCount)

        while let last = iterator.next() {
            delta.append(last)
        }

        XCTAssertEqual(delta, [1, 1, -6, -4, 2, -5, 0])
    }
}
