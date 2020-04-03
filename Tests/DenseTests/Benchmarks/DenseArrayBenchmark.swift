//
//  DenseArrayBenchmark.swift
//  DenseTests
//
//  Created by Vitali Kurlovich on 3/27/20.
//

@testable import Dense
import XCTest

final class DenseArrayBenchmark: XCTestCase {
    func testAccessSpeed() throws {
        let size = 1_000_000
        let range = -12000 ... 12000

        let array = (0 ..< size).compactMap { _ in range.randomElement() }

        let denseArray = DenseArray(array)

        measure {
            _ = denseArray.reduce(0, +)
        }
    }
}
