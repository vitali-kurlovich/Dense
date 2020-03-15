//
//  СompactArray+Equatable.swift
//  CompactArray
//
//  Created by Vitali Kurlovich on 3/14/20.
//

import Foundation

extension DenseArray {
    public static func == (lhs: [T], rhs: DenseArray<T>) -> Bool {
        guard lhs.count == rhs.count else {
            return false
        }

        for index in 0 ..< rhs.count {
            let position = lhs.index(lhs.startIndex, offsetBy: index)
            guard lhs[position] == rhs[index] else {
                return false
            }
        }

        return true
    }

    public static func == (lhs: DenseArray<T>, rhs: [T]) -> Bool {
        guard lhs.count == rhs.count else {
            return false
        }

        for index in 0 ..< lhs.count {
            let position = rhs.index(rhs.startIndex, offsetBy: index)
            guard rhs[position] == lhs[index] else {
                return false
            }
        }

        return true
    }
}
