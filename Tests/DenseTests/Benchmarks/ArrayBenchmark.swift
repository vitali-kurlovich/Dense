//
//  ArrayBenchmark.swift
//  DenseTests
//
//  Created by Vitali Kurlovich on 3/27/20.
//

import XCTest

final class ArrayBenchmark: XCTestCase {
    func testAccessSpeed() throws {
        let size = 1_000_000
        let range = -12000 ... 12000

        let array = (0 ..< size).compactMap { _ in range.randomElement() }

        measure {
            _ = array.reduce(0, +)
        }
    }
}
