//
//  SequenceInfoTest.swift
//  CompactArrayTests
//
//  Created by Vitali Kurlovich on 3/15/20.
//

@testable import Dense
import XCTest

final class SequenceInfoTest: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSequenceInfo() {
        let array = [3, 15, 7, 9]

        let info = array.sequenceInfo()

        XCTAssertEqual(info, SequenceInfo(count: 4, min: 3, max: 15, gcd: 2))
    }

    func testSequenceInfo_1() {
        let array = [3, 16, 7, 9]

        let info = array.sequenceInfo()

        XCTAssertEqual(info, SequenceInfo(count: 4, min: 3, max: 16, gcd: 1))
    }
}
