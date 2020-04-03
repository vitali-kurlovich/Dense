//
//  InternalDenseArrayTests.swift
//  DenseTests
//
//  Created by Vitali Kurlovich on 4/3/20.
//

@testable import Dense
import XCTest

final class InternalDenseArrayTests: XCTestCase {
    func testRequaredBits() throws {
        XCTAssertEqual(requaredBits(for: 0), 0)
        XCTAssertEqual(requaredBits(for: 1), 1)
        XCTAssertEqual(requaredBits(for: 2), 2)
        XCTAssertEqual(requaredBits(for: 3), 2)
        XCTAssertEqual(requaredBits(for: 4), 3)
        XCTAssertEqual(requaredBits(for: 5), 3)
        XCTAssertEqual(requaredBits(for: 6), 3)
        XCTAssertEqual(requaredBits(for: 7), 3)
        XCTAssertEqual(requaredBits(for: 8), 4)
        XCTAssertEqual(requaredBits(for: 9), 4)
        XCTAssertEqual(requaredBits(for: 10), 4)
        XCTAssertEqual(requaredBits(for: 15), 4)
        XCTAssertEqual(requaredBits(for: 31), 5)
        XCTAssertEqual(requaredBits(for: 32), 6)
        XCTAssertEqual(requaredBits(for: 63), 6)
        XCTAssertEqual(requaredBits(for: 64), 7)
        XCTAssertEqual(requaredBits(for: 95), 7)
        XCTAssertEqual(requaredBits(for: 127), 7)
        XCTAssertEqual(requaredBits(for: 128), 8)
        XCTAssertEqual(requaredBits(for: 200), 8)
        XCTAssertEqual(requaredBits(for: 255), 8)
        XCTAssertEqual(requaredBits(for: 256), 9)
        XCTAssertEqual(requaredBits(for: 456), 9)
        XCTAssertEqual(requaredBits(for: 511), 9)
        XCTAssertEqual(requaredBits(for: 512), 10)
        XCTAssertEqual(requaredBits(for: 1023), 10)
        XCTAssertEqual(requaredBits(for: 1024), 11)
        XCTAssertEqual(requaredBits(for: 1824), 11)
        XCTAssertEqual(requaredBits(for: 2047), 11)
        XCTAssertEqual(requaredBits(for: 2048), 12)
    }

    static var allTests = [
        ("testRequaredBits", testRequaredBits),
    ]
}
