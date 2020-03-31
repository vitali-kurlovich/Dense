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
        let array: [Int] = [1, 5, 6, 7, 9, 13, 15, 17, 20, 22, 26, 29, 31, 34, 37, 40, 42, 45, 48, 52, 55]
        let compact = DenseSequence(array)

        XCTAssertEqual(array, Array(compact))
    }

    func testDenseSequenceEquatable() {
        let firstArr: [Int] = [1, 5, 6, 7, 9, 13, 15, 17, 20, 22, 26, 29, 31, 34, 37, 40, 42, 45, 48, 52, 55]

        let secondArr: [Int] = [1, 5, 6, 7, 9, 13, 15, 17, 20, 22, 26, 29, 31, 34, 37, 40, 42, 45, 48, 52, 56]

        let thridArr: [Int] = [1, 5, 6, 7, 9, 13, 15, 17, 20, 22, 26, 29, 31, 34, 37, 40, 42, 45, 48, 52, 55, 1]

        XCTAssertEqual(DenseSequence(firstArr), DenseSequence(firstArr))
        XCTAssertEqual(DenseSequence([Int]()), DenseSequence([Int]()))
        XCTAssertEqual(DenseSequence([6]), DenseSequence([6]))

        XCTAssertNotEqual(DenseSequence([1]), DenseSequence([Int]()))
        XCTAssertNotEqual(DenseSequence(firstArr), DenseSequence(secondArr))
        XCTAssertNotEqual(DenseSequence(firstArr), DenseSequence(thridArr))
    }

    func testDenseSequenceCodable() {
        let array: [Int] = [1, 5, 6, 7, 9, 13, 15, 17, 20, 22, 26, 29, 31, 34, 37, 40, 42, 45, 48, 52, 55]

        let compact = DenseSequence(array)

        let encoder = JSONEncoder()

        let data = try! encoder.encode(compact)

        let decoder = JSONDecoder()
        let decoded = try! decoder.decode(DenseSequence<Int>.self, from: data)

        XCTAssertEqual(compact, decoded)
    }

    func testDenseSequenceCapacity() {
        let count = 1_000_000

        let buffer = (0 ..< count).map { Int(Float($0) * 1.2) }
        let dense = DenseArray(buffer)
        let compact = DenseSequence(buffer)
        let dSize = dense.capacity * MemoryLayout<Int>.stride
        let bSize = buffer.count * MemoryLayout<Int>.stride
        let cSize = compact.capacity * MemoryLayout<Int>.stride

        print("\(bSize) vs \(cSize) vs\(dSize)")
    }
}
