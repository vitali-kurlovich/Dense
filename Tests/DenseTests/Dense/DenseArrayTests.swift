@testable import Dense
import XCTest

#if canImport(os)
    import os.log
#endif

final class DenseArrayTests: XCTestCase {
    func testDenseArray() {
        let uarray: [UInt] = [5, 6, 7, 45, 2, 63, 13, 54, 66, 44, 33, 164, 321, 54, 123]

        let ucompact = DenseArray(uarray)

        XCTAssertTrue(uarray == ucompact)
        XCTAssertTrue(ucompact == uarray)

        let array: [Int] = [5, 6, 7, 45, 2, 63, 13, 54, 66, 44, 33, 164, 321, 54, 123]

        let compact = DenseArray(array)

        XCTAssertTrue(array == compact)

        let narray: [Int] = [5, 6, 7, 45, 2, 63, 13, 54, 67, 44, 33, 164, 321, 54, 123]

        XCTAssertFalse(narray == compact)
        XCTAssertFalse(compact == narray)

        let nnarray: [Int] = [5, 6, 7, 45, 2, 63, 13, 54, 66, 44, 33, 164, 321, 54, 123, 4]

        XCTAssertFalse(nnarray == compact)
        XCTAssertFalse(compact == nnarray)
    }

    func testDenseArray_1() {
        let uarray: [UInt] = [0, 5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5,
                              5, 5, 5, 5, 5, 5, 5, 5, 5]

        let ucompact = DenseArray(uarray)

        XCTAssertTrue(uarray == ucompact)

        let array: [Int] = [0, 5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5]

        let compact = DenseArray(array)

        XCTAssertTrue(array == compact)
    }

    func testDenseArray_2() {
        let uarray: [UInt] = [0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                              7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7]

        let ucompact = DenseArray(uarray)

        XCTAssertTrue(uarray == ucompact)

        let array: [Int] = [0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                            7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7]

        let compact = DenseArray(array)

        XCTAssertTrue(array == compact)
    }

    func testDenseArray_3() {
        let array = [-2, 4, -8, 2, 4, 8, 2, -4, 8,
                     2, 4, -8, 2, -4, 8, 2, 4, 8,
                     2, 4, 8, -2, 4, 8, 2, -4, 8]

        let compact = DenseArray(array)

        XCTAssertTrue(array == compact)
    }

    func testDenseArray_4() {
        let array =
            [221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221,
             221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221,
             221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221,
             221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221,
             221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221,
             221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221,
             221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221,
             221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221,
             221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221,
             221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221,
             221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221,
             221, 221, 221, 221, 221, 221, 221, 221, 221, 221, 221]

        let compact = DenseArray(array)

        XCTAssertEqual(compact.capacity, 0)
        XCTAssertTrue(array == compact)
    }

    func testDenseArray_5() {
        let array: [UInt16] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, UInt16.max / 2 + 1]

        let compact = DenseArray(array)
        XCTAssertTrue(array == compact)
    }

    func testDenseArray_6() {
        var array = [Int.min / 2, Int.min / 2 + 1, 0, Int.max / 2 - 1, Int.max / 2]
        array.reserveCapacity(1024)

        for _ in 0 ..< 1024 {
            guard let random = (Int.min / 2 ..< Int.max / 2).randomElement() else {
                break
            }
            array.append(random)
        }

        let compact = DenseArray(array)
        XCTAssertTrue(array == compact)
    }

    func testDenseArrayCoding_1() {
        let array = [-2, 4, -8, 2, 4, 8, 2, -4, 8,
                     2, 4, -8, 2, -4, 8, 2, 4, 8,
                     2, 4, 8, -2, 4, 8, 2, -4, 8]

        let compact = DenseArray(array)

        let encoder = JSONEncoder()

        let data = try! encoder.encode(compact)

        let decoder = JSONDecoder()
        let decoded = try! decoder.decode(DenseArray<Int>.self, from: data)

        XCTAssertEqual(compact, decoded)
    }

    func testDenseArrayCoding_2() {
        let array: [Int] = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
                            5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]

        let compact = DenseArray(array)

        let encoder = JSONEncoder()

        let data = try! encoder.encode(compact)

        let decoder = JSONDecoder()
        let decoded = try! decoder.decode(DenseArray<Int>.self, from: data)

        XCTAssertEqual(compact, decoded)
    }

    func testDenseArrayCoding_3() {
        let array: [Int] = [5]

        let compact = DenseArray(array)

        let encoder = JSONEncoder()

        let data = try! encoder.encode(compact)

        let decoder = JSONDecoder()
        let decoded = try! decoder.decode(DenseArray<Int>.self, from: data)

        XCTAssertEqual(compact, decoded)
    }

    func testDenseArrayCoding_4() {
        let array: [Int] = [5]

        let compact = DenseArray(array)

        let encoder = JSONEncoder()

        let data = try! encoder.encode(compact)

        let decoder = JSONDecoder()
        let decoded = try! decoder.decode(DenseArray<Int>.self, from: data)

        XCTAssertEqual(compact, decoded)
    }

    func testDenseArrayCoding_5() {
        let array: [Int] = []

        let compact = DenseArray(array)

        let encoder = JSONEncoder()

        let data = try! encoder.encode(compact)

        let decoder = JSONDecoder()
        let decoded = try! decoder.decode(DenseArray<Int>.self, from: data)

        XCTAssertEqual(compact, decoded)
    }

    func testDenseArrayCoding_6() {
        let array1: [Int] = [6_554_544]
        let array2: [Int] = [5456, 45454]
        let array3: [Int] = []
        let array4: [Int] = [6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6]
        let array5: [Int] = [6]
        let array6: [Int] = []
        let array7: [Int] = [6, -6, 6, -6, 6, -6, 6, 6, -6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6]

        let compact1 = DenseArray(array1)
        let compact2 = DenseArray(array2)
        let compact3 = DenseArray(array3)
        let compact4 = DenseArray(array4)
        let compact5 = DenseArray(array5)
        let compact6 = DenseArray(array6)
        let compact7 = DenseArray(array7)

        let array = [array1, array2, array3, array4, array5, array6, array7]
        let compact = [compact1, compact2, compact3, compact4, compact5, compact6, compact7]

        for (index, value) in array.enumerated() {
            XCTAssert(value == compact[index])
        }

        let encoder = JSONEncoder()

        let data = try! encoder.encode(compact)

        let decoder = JSONDecoder()
        let decoded = try! decoder.decode([DenseArray<Int>].self, from: data)

        XCTAssertEqual(compact, decoded)
    }

    static var allTests = [
        ("testDenseArray", testDenseArray),
        ("testDenseArray_1", testDenseArray_1),
        ("testDenseArray_2", testDenseArray_2),
        ("testDenseArray_3", testDenseArray_3),
        ("testDenseArray_4", testDenseArray_4),
        ("testDenseArray_5", testDenseArray_5),
        ("testDenseArray_6", testDenseArray_6),
        ("testDenseArrayCoding_1", testDenseArrayCoding_1),
        ("testDenseArrayCoding_2", testDenseArrayCoding_2),
        ("testDenseArrayCoding_3", testDenseArrayCoding_3),
        ("testDenseArrayCoding_4", testDenseArrayCoding_4),
        ("testDenseArrayCoding_5", testDenseArrayCoding_5),
        ("testDenseArrayCoding_6", testDenseArrayCoding_6),
    ]
}
