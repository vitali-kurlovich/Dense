//
//  Sequence+SequenceInfo.swift
//  CompactArray
//
//  Created by Vitali Kurlovich on 3/15/20.
//

import Foundation

internal
struct SequenceInfo<T: BinaryInteger>: Equatable {
    let count: Int
    let min: T?
    let max: T?
    let gcd: T
}

internal
extension Sequence where Self.Element: BinaryInteger {
    func sequenceInfo() -> SequenceInfo<Element> {
        var iterator = makeIterator()

        guard let first = iterator.next() else {
            return .init(count: 0, min: nil, max: nil, gcd: 1)
        }

        var count = 1

        var min = first
        var max = first

        while let last = iterator.next() {
            count += 1
            if last > max {
                max = last
            } else if last < min {
                min = last
            }
        }

        if min == max {
            return .init(count: count, min: min, max: max, gcd: 1)
        }

        var gcd = max - min

        iterator = makeIterator()

        while let last = iterator.next(), gcd > 1 {
            let value = last - min
            gcd = self.gcd(value, gcd)
        }

        // gcd(0, magnitude)

        return .init(count: count, min: min, max: max, gcd: gcd)
    }

    private
    func gcd(_ a: Element, _ b: Element) -> Element {
        var a = a
        var b = b

        while b != 0 {
            let c = a % b
            a = b
            b = c
        }

        return a * a.signum()
    }
}
