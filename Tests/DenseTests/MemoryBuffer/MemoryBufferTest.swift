//
//  MemoryBufferTest.swift
//  DenseTests
//
//  Created by Vitali Kurlovich on 3/27/20.
//

@testable import Dense
import XCTest

final class MemoryBufferTest: XCTestCase {
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
}
