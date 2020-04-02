//
//  MemoryBufferTest.swift
//  DenseTests
//
//  Created by Vitali Kurlovich on 3/27/20.
//

@testable import Dense
import XCTest

final class MemoryBufferTest: XCTestCase {
    func testMemoryBufferEquatable() {
        let first = MemoryBuffer<Int>(5)
        first[0] = 5
        first[1] = -76545
        first[2] = 2745
        first[3] = -76545
        first[4] = 276

        let second = MemoryBuffer<Int>(5)
        second[0] = 5
        second[1] = -76545
        second[2] = 2745
        second[3] = -76545
        second[4] = 276
        XCTAssertEqual(first, second)

        let third = MemoryBuffer<Int>(5)
        third[0] = 5
        third[1] = -76545
        third[2] = 2744
        third[3] = -76545
        third[4] = 276
        XCTAssertNotEqual(first, third)

        let fourth = MemoryBuffer<Int>(6)
        fourth[0] = 5
        fourth[1] = -76545
        fourth[2] = 2745
        fourth[3] = -76545
        fourth[4] = 276
        fourth[5] = 0
        XCTAssertNotEqual(first, fourth)
    }

    func testMemoryBufferCodable() {
        let buffer = MemoryBuffer<Int>(5)
        buffer[0] = 5
        buffer[1] = -76545
        buffer[2] = 2745
        buffer[3] = -76545
        buffer[4] = 276

        let encoder = JSONEncoder()

        let data = try! encoder.encode(buffer)

        let decoded = try! JSONDecoder().decode(MemoryBuffer<Int>.self, from: data)

        XCTAssertEqual(buffer, decoded)
    }

    static var allTests = [
        ("testMemoryBufferCodable", testMemoryBufferCodable),
        ("testMemoryBufferEquatable", testMemoryBufferEquatable),
    ]
}
